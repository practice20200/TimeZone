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
    let dataRef = [Profile]()
    let realm = try! Realm()
    var imageView = UIImageView()
    var profileImage = "person.crop.circle"

    private var country : BaseUILabel = {
        let label = BaseUILabel()
        label.text = "   Friends"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.heightAnchor.constraint(equalToConstant: 75).isActive = true
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
        tableView.delegate = self
        tableView.dataSource = self
        
//        for i in realm.objects(Profile.self){
//            data.append(i)
//            print("data=================append: \(i)")
//        }
        
//        let realmdata = realm.objects(Profile.self)
//        data.append(contentsOf: realmdata)
        
        NSLayoutConstraint.activate([
            
            lableStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lableStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lableStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: lableStack.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("===============================================WillAppear")
        let realmdata = realm.objects(Profile.self)
        data = realmdata.reversed()
        tableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("===============================================willlayout")
    }

    @objc func addHandler(){
        let vc = FriendsAddViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
}


extension FriendViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = IndividualViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.navigationController?.navigationBar.prefersLargeTitles = false
        let passingData = data[indexPath.row]
        vc.data = Profile(value: passingData)
        vc.index = indexPath.row
        print("passingData.profileImage:\(passingData.profileImage)")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            realm.beginWrite()
            let item = data
            
            realm.delete(item)
            
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
        
        cell.profileImage.image =  UIImage(contentsOfFile: item.profileImage) ?? UIImage(systemName: "person.crop.circle")!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

}


extension FriendViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let imagee = info[UIImagePickerController.InfoKey(rawValue: profileImage) ] as? UIImage else{
            print("imagepIcker nil")
            return }
        
    }
    
 
}
