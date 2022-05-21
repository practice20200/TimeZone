//
//  ViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements

class ViewController: UIViewController {
    
    var data = [ToDoListItem]()
    var scheduledTimer: Timer!
    
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            
            timeLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            timeLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: timeLable.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        
        ])
        
        scheduledTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(refreshTime), userInfo: nil, repeats: true)
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
        return 70
    }
}




class ViewTableCell : UITableViewCell{
    
    lazy var timeLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var contentLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }()
    
    lazy var contentStack: HStack = {
        let stack = HStack()
        stack.addArrangedSubview(timeLabel)
        stack.addArrangedSubview(contentLabel)
        stack.spacing = 16
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
    func updateView(
        time : String,
        content : String,
        isChecked: Bool = false
    ) {
        timeLabel.text = time
        contentLabel.text = content
    }
    
}


struct ToDoListItem {
    var time : String
    var content : String
    var isChecked: Bool
}

class ConvenientTool{
    static func formatterDateDetailed(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yy HH:mm"
        return formatter.string(from: date)
    }
}
