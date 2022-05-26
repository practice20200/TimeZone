//
//  ViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements

class ViewController: UIViewController {
    
    var data = [ViewModel]()
    var scheduledTimer: Timer!
    var result: Result?
    
    lazy var timeLable : BaseUILabel = {
        let label = BaseUILabel()
        let date = Date()
        let timeLabel = ConvenientTool.formatterDateDetailed(date: date)
        label.text = timeLabel
        label.layer.shadowOpacity = 0.2
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.heightAnchor.constraint(equalToConstant: 75).isActive = true
        return label
    }()
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .secondarySystemBackground
        table.register(ViewTableCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    lazy var contentStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(timeLable)
        stack.addArrangedSubview(tableView)
        stack.alignment = .center
        return stack
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentStack)
        
        parseJSON()
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            
            timeLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            timeLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: timeLable.safeAreaLayoutGuide.topAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
        
        scheduledTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(refreshTime), userInfo: nil, repeats: true)
        
        
        let countryBTN = UIBarButtonItem(title: "Country", style: .plain, target: self, action: #selector(countryHandler))
        navigationItem.rightBarButtonItem = countryBTN

    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }

    
    @objc func refreshTime(){
        let date = Date()
        let timeLabel = ConvenientTool.formatterDateDetailed(date: date)
        timeLable.text = timeLabel
    }
     
    @objc func countryHandler(){
        let vc = CountriesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
   func parseJSON(){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
                
        let url = URL(fileURLWithPath: path)
        
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from:  jsonData)
            
            if let result = result {
                print("reslt: \(result)")
            }else {
                print("Failed to parse")
            }
            
        }catch{
            print("Error: \(error.localizedDescription)")
        }
    }
}


extension ViewController : UITableViewDelegate{

}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewTableCell
//       let item = data[indexPath.row]
////
//        cell.updateView(
//            time: item.time, content: item.content
//        )
////
//        cell.accessoryType = item.isChecked ? .checkmark: .none
       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

struct Result: Codable {
    let data: [ResultItem]
}

struct ResultItem: Codable {
    let value: String
    let abbr: String
    let offset: Float
    let isdst: Bool
    let text: String
    let utc: [String]
}


