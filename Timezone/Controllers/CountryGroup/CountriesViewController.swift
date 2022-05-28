//
//  CountriesViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements

class CountriesViewController: UIViewController {

    var data = countryDataProvider.dataProvider()
    var countryName = "Country"
    
    private var country : BaseUILabel = {
        let label = BaseUILabel()
        label.text = "  Country"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.heightAnchor.constraint(equalToConstant: 75).isActive = true
        return label
    }()
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .secondarySystemBackground
        table.register(CountryTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    lazy var contentStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(country)
        stack.addArrangedSubview(tableView)
        return stack
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        title = countryName
//        navigationItem.largeTitleDisplayMode = .always
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.isNavigationBarHidden = true
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
        
//        view.addSubview(contentStack)
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        NSLayoutConstraint.activate([
//            contentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            contentStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            contentStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            contentStack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
        
//        let friendBTN = UIBarButtonItem(title: "Friend", style: .plain, target: self, action: #selector(friendHandler))
//        navigationItem.rightBarButtonItem = friendBTN
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        title = countryName
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
     
    @objc func friendHandler(){
        let vc = FriendViewController()
//        let navVC = UINavigationController(rootViewController: vc)
//        present(navVC, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }

}


extension CountriesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        
        let vc = CategolizedFriendGroupViewController()
        vc.selectedCountry = data[indexPath.row].country
        countryName = data[indexPath.row].country
        
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension CountriesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        let item = data[indexPath.row]
        cell.countryLabel.text = item.country
       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

struct countryDataProvider {
    static func dataProvider() -> [Country] {
        var data = [Country]()
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Canda"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        data.append(Country(country: "Japan"))
        return data
    }
}
