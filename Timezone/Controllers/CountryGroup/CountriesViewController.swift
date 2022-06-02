//
//  CountriesViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements

class CountriesViewController: UIViewController {

//    var data = countryDataProvider.dataProvider()
    var countryName = "Country"
    var data = [CountriesData]()
    var countries: CountriesData?
    var passedIndexPath: IndexPath?
    var passedSection = 0
    var trueFalseChecker = false
    
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
        view.addSubview(contentStack)
//        parseJSON()
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
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parseJSON()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    
    func parseJSON(){
         guard let path = Bundle.main.path(forResource: "countriesData", ofType: "json") else {
             print("====================guard let")
             return }
                 print("Path: =====================\(path)")
         let url = URL(fileURLWithPath: path)
        print("URL: =====================\(url)")
         
         do {
             let jsonData = try Data(contentsOf: url)
             print("1")
             countries = try JSONDecoder().decode(CountriesData.self, from:  jsonData)
             print("2")
             if let result = countries {
                 print("reslt: \(result)")
                 data.append(result)
//                 isCheckedData.append(isChekedResult(result: result, isChecked: false))
                 print("Succeeded in parsing")
             }else {
                 print("Failed to parse")
             }
             
         }catch{
             print("Error: \(error.localizedDescription)")
         }
     }
    
    
    
     
    @objc func friendHandler(){
        let vc = FriendViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}


extension CountriesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = CategolizedFriendGroupViewController()
//        vc.selectedCountry = data[indexPath.row].country
//        countryName = data[indexPath.row].data[indexPath.row].name
        
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
//        let item = data2[indexPath.row].data[indexPath.row]
//        cell.countryLabel.text = item.name
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

//
//struct countryDataProvider {
//    static func dataProvider() -> (String,[Country]) {
//        var Adata = (String, [Country])
//        var Bdata = (String, [Country])
//        var Cdata = (String, [Country])
//        var Ddata = (String, [Country])
//        var Edata = (String, [Country])
//        var Fdata = (String, [Country])
//        var Gdata = (String, [Country])
//        var Hdata = (String, [Country])
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Canda"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        data.append(Country(country: "Japan"))
//        return data
//    }
