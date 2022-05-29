//
//  CategolizedFriendGroupViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-27.
//

import Foundation
import UIKit
import Elements

class CategolizedFriendGroupViewController: UIViewController {
    
    var data = ProfileDataProvider.dataProvider()
    var selectedCountry = ""
    
    lazy var countryLable : BaseUILabel = {
        let label = BaseUILabel()
        label.text = "  " + selectedCountry
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.heightAnchor.constraint(equalToConstant: 75).isActive = true
        return label
    }()
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .secondarySystemBackground
        table.register(CategolizedFriendGroupViewControllerCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    lazy var contentStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(countryLable)
        stack.addArrangedSubview(tableView)
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(contentStack)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            countryLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countryLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            tableView.topAnchor.constraint(equalTo: countryLable.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
        navigationItem.rightBarButtonItem = addButton
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func addHandler(){
        let vc = FriendsAddViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension CategolizedFriendGroupViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        country.text = data[indexPath.row].country
        
        let vc = IndividualViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension CategolizedFriendGroupViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("data.count: \(data.count)")
        return data.count
//        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategolizedFriendGroupViewControllerCell
        let item = data[indexPath.row]
        cell.nameLabel.text = item.name
       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}


struct ProfileDataProvider {
    static func dataProvider() -> [Profile] {
        var data = [Profile]()
//        data.append(Profile(name: "John", Location: "Japan", Timezone: "Japan", PreferrableCountryTime: "18:00-22:00"))
//        data.append(Profile(name: "James", Location: "Japan", Timezone: "Japan", PreferrableCountryTime: "18:00-22:00"))
//        data.append(Profile(name: "Tony", Location: "Japan", Timezone: "Japan", PreferrableCountryTime: "18:00-22:00"))
//        data.append(Profile(name: "Fred", Location: "Japan", Timezone: "Japan", PreferrableCountryTime: "18:00-22:00"))
//        data.append(Profile(name: "Neil", Location: "Japan", Timezone: "Japan", PreferrableCountryTime: "18:00-22:00"))
        
        return data
    }
}
