//
//  FriendViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements
import Realm
import RealmSwift

class FriendViewController: UIViewController {
    
    var data = [Profile]()
    let realm = try! Realm()

    private var country : BaseUILabel = {
        let label = BaseUILabel()
        label.text = "   Friends"
//        label.layer.shadowOpacity = 0.2
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.heightAnchor.constraint(equalToConstant: 75).isActive = true
//        label.backgroundColor = .blue
        return label
    }()
    
    lazy var addBTN : BaseUIButton = {
        let button = BaseUIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25
        button.contentMode = .topRight
        button.addTarget(self, action: #selector(addHandler), for: .touchUpInside)
        return button
    }()
    
    lazy var lableStack : HStack = {
        let stack = HStack()
        stack.addArrangedSubview(country)
        stack.addArrangedSubview(addBTN)
        return stack
    }()
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .secondarySystemBackground
        table.register(FriendsListCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    lazy var contentStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(lableStack)
        stack.addArrangedSubview(tableView)
        return stack
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(contentStack)
        for i in realm.objects(Profile.self){
            data.append(i)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            
            lableStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lableStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lableStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: lableStack.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
        
        
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
//        navigationItem.rightBarButtonItem = addButton
//        navigationItem.titleView?.sendSubviewToBack(tableView)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//
//    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        tableView.frame = view.bounds
    }

    
    @objc func addHandler(){
        let vc = FriendsAddViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
//        navigationController?.pushViewController(vc, animated: true)
    }
    
//    var data = personData.dataProvider()
}


extension FriendViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = IndividualViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.navigationController?.navigationBar.prefersLargeTitles = false
        vc.data = 
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            realm.beginWrite()
            data.remove(at: indexPath.row)
            try! realm.commitWrite()
        }
    }
    
}

extension FriendViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
//        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsListCell
        let item = data[indexPath.row]
        cell.nameLabel.text = item.name
        cell.countryLabel.text = item.Location

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

}


