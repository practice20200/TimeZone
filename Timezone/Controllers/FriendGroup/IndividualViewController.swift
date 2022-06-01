//
//  IndividualViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-23.
//

import UIKit
import Elements
import Realm
import RealmSwift

class IndividualViewController: UIViewController {

//    var data = profileVIewDataProvider.dataProvider()
    var data = Profile()
    var profileImage: UIImage?
    var text1 = "Enter name"
    var text2 = "Enter location"
    var text3 = "Enter timezone"
    var text4 = "Enter preferrable contact time"
    let realm = try! Realm()
    var index = 0
    var pndData = UIImage().pngData()
    
    lazy var uiView : UIView = {
        let headerView = BaseUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        let imageView = UIImageView(frame: CGRect(x: (headerView.bounds.width-150)/2, y: 75, width: 150, height: 150))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = imageView.bounds.width/2
        imageView.layer.masksToBounds = true
//        let image = UIImage(systemName: "person.crop.circle")
        var imageDataURL = realm.objects(Profile.self)
        
        print("==========================data.profileImage: \(imageDataURL)")
        let fileURL = URL(string: imageDataURL[index].profileImage)
        print("fileURL: \(fileURL)")
        guard fileURL != nil, let fileURL = fileURL else{
            print("==========================fileURL nil")
            return UIView()}
        let filePath = fileURL.path
        print("==========================filePath: \(filePath)")
//
        guard UIImage(contentsOfFile: filePath) != nil, let image = UIImage(contentsOfFile:filePath)  else{
            print("========================imagefetch nil: \(filePath)")
            return UIView()
        }
//
//        let image = UIImage(contentsOfFile: filePath)
        
        
//        imageView.sd_setImage(with: fileURL)
        
        print("Success")
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
        tableView.register(IndividualTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .secondarySystemBackground
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
        tableView.tableHeaderView = uiView
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
//        navigationController?.isNavigationBarHidden = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
        navigationItem.rightBarButtonItem = addButton
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
        gradientLayer.frame = uiView.bounds
    }

    
    @objc func addHandler(){
        let vc = FriendsAddViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


extension IndividualViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    
}

extension IndividualViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IndividualTableViewCell
     
        if indexPath.section == 0{
            cell.nameLabel.text = data.name
        }else if indexPath.section == 1{
            cell.nameLabel.text = data.Location
        }else if indexPath.section == 2{
            cell.nameLabel.text = data.Timezone
        }else if indexPath.section == 3{
            cell.nameLabel.text = data.PreferrableCountryTime
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titleData = personData.dataProvider()
        return titleData[section].0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }

}


struct personData {
    static func dataProvider() -> [(String, String)] {
        return [
            ("user name", "John"),
            ("Location", "California, US"),
            ("Timezone", "California, US"),
            ("Prewferrable time", "10:00 - 18:00")
        ]
    }
}

