//
//  FriendViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements

class FriendViewController: UIViewController {

    private var country : BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Friends"
        label.layer.shadowOpacity = 0.2
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.heightAnchor.constraint(equalToConstant: 75).isActive = true
        return label
    }()
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .secondarySystemBackground
        table.register(FriendsListCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    lazy var contentStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(country)
        stack.addArrangedSubview(tableView)
        stack.alignment = .center
        return stack
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentStack)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            
            country.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            country.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: country.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
        navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }

    
    @objc func addHandler(){
        let vc = FriendsAddViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    var data = personData.dataProvider()
}


extension FriendViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = IndividualViewController()
            navigationController?.pushViewController(vc, animated: true)
    }
    

    
}

extension FriendViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsListCell
        let item = data[indexPath.section].1
        cell.nameLabel.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

}


