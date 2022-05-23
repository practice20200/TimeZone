//
//  FriendsAddViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements

class FriendsAddViewController: UIViewController {
    
    var data = profileVIewDataProvider.dataProvider()

    lazy var uiView : UIView = {
        let headerView = BaseUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        let imageView = UIImageView(frame: CGRect(x: (headerView.bounds.width-150)/2, y: 75, width: 150, height: 150))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = imageView.bounds.width/2
        imageView.layer.masksToBounds = true
        let image = UIImage(systemName: "person.2.circle")
        let configuration = UIImage.SymbolConfiguration(paletteColors:
         [.white])
        imageView.image = image
        imageView.preferredSymbolConfiguration = configuration
        
        let contentView = UIView()
        contentView.layer.addSublayer(gradientLayer)
        headerView.bringSubviewToFront(imageView)
        headerView.addSubview(contentView)
        headerView.addSubview(imageView)
        return headerView
    }()
    
    lazy var gradientLayer : CAGradientLayer = {
        let color = CAGradientLayer()
        color.colors = [
            UIColor(red: 48.0/255.0, green: 35.0/255.0, blue: 174.0/255.0, alpha: 1.0).cgColor,
               UIColor(red: 200.0/255.0, green: 109.0/255.0, blue: 215.0/255.0, alpha: 1.0).cgColor
        ]
        return color
    }()

    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(FriendsAddTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .secondarySystemBackground
        return tableView
    }()

    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        updateDeletedAccount()
        updateAccountName()
        title = "Friends"
        
        view.addSubview(tableView)
        tableView.tableHeaderView = uiView
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addHandler))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
        gradientLayer.frame = uiView.bounds
    }

    

    func updateDeletedAccount(){
        
    }
    
    func updateAccountName(){

    }
    
    
    @objc func addHandler(){

    }
    
}


extension FriendsAddViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    
}

extension FriendsAddViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsAddTableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.backgroundColor = .systemCyan
        return data[section]
    }
}




struct profileVIewDataProvider {
    static func dataProvider() -> [String] {
        var data = [String]()
        data.append("Name")
        data.append("Location")
        data.append("Timezone")
        data.append("Preferrable Contact Time")

        return data
    }
}
