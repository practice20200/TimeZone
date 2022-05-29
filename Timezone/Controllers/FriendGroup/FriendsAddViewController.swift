//
//  FriendsAddViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements
import RealmSwift
import Realm

class FriendsAddViewController: UIViewController, UINavigationControllerDelegate {
    
    var data = profileVIewDataProvider.dataProvider()
    let realm = try! Realm()
    var alertTitle = "Not Selected Yet"
//    var content = ""
    var text1 = "Enter name"
    var text2 = "Enter location"
    var text3 = "Enter timezone"
    var text4 = "Enter preferrable contact time"
    var profileImage = "person.crop.circle"
    
    let defaultText1 = "Enter name"
    let defaultText2 = "Enter location"
    let defaultText3 = "Enter timezone"
    let defaultText4 = "Enter preferrable contact time"
    
    static let identifier = "tableViewCell"
    weak var FriendsAddTableViewCellDelegate : FriendsAddTableViewCellDelegate?
    var image = UIImage(systemName: "person.crop.circle")
    var imageView = UIImageView()
    lazy var uiView : UIView = {
        let headerView = BaseUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        imageView = UIImageView(frame: CGRect(x: (headerView.bounds.width-150)/2, y: 75, width: 150, height: 150))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = imageView.bounds.width/2
        imageView.layer.masksToBounds = true
        
        let configuration = UIImage.SymbolConfiguration(paletteColors:
         [.white])
        imageView.image = image
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTappedImage))
        imageView.preferredSymbolConfiguration = configuration
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        
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
        title = "Add a friend"
        
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
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHandler))
        navigationItem.rightBarButtonItem = saveButton
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
        gradientLayer.frame = uiView.bounds
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let vc = FriendViewController()
        for i in realm.objects(Profile.self){
            vc.data.append(i)
        }
        tableView.reloadData()
print("4444444444444444444444")
    }
    
    
    
    
    func nameAlertViewHandler(title: String){
        let message =  "Please fill in this blank"
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "edit", style: .default) { [weak self] _ in
            alert.textFields?.first?.keyboardType = .default
            
            guard let item = alert.textFields?.first?.text , !item.isEmpty else { return }
            self?.text1 = item
            
            print("------------item: \(item)")
            self?.tableView.reloadData()
        }
        alert.addTextField()
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func locationAlertViewHandler(title: String){
        let message =  "Please fill in this blank"
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "edit", style: .default) { [weak self] _ in
            alert.textFields?.first?.keyboardType = .default
            
            guard let item = alert.textFields?.first?.text , !item.isEmpty else { return }
            self?.text2 = item
            
            print("------------item: \(item)")
            self?.tableView.reloadData()
        }
        alert.addTextField()
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func timezoneAlertViewHandler(title: String){
        let message =  "Please fill in this blank"
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "edit", style: .default) { [weak self] _ in
            alert.textFields?.first?.keyboardType = .default
            
            guard let item = alert.textFields?.first?.text , !item.isEmpty else { return }
            self?.text3 = item
            print("------------item: \(item)")
            self?.tableView.reloadData()
        }
        alert.addTextField()
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func PreferableAlertViewHandler(title: String){
        let message =  "Please fill in this blank"
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "edit", style: .default) { [weak self] _ in
            alert.textFields?.first?.keyboardType = .default
            
            guard let item = alert.textFields?.first?.text , !item.isEmpty else { return }
            self?.text4 = item
            
            print("------------item: \(item)")
            self?.tableView.reloadData()
        }
        alert.addTextField()
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func saveHandler(){
        let new = Profile()
        let vc = FriendViewController()
        
        if text1 != defaultText1,
           text2 != defaultText2,
           text3 != defaultText3,
           text4 != defaultText4 {
            
            realm.beginWrite()
            new.profileImage = profileImage
            new.name = text1
            new.Timezone = text2
            new.Location = text3
            new.PreferrableCountryTime = text4
            realm.add(new)
            let userData = realm.objects(Profile.self)
            print("全てのデータ\(userData)")
//            vc.data.append([userData])
            print("new.name: \(new.name)")
            try! realm.commitWrite()
    //        navigationController?.popViewController(animated: true)
            navigationController?.dismiss(animated: true)
            print("========================new: \(vc.data)")
        }
    }
    
    @objc func didTappedImage(){
        print("Tapped")
        presentPhotoActionSheet()


    }
}


extension FriendsAddViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        FriendsAddTableViewCellDelegateHandler()
        
        if indexPath.section == 0{
            alertTitle = "Name"
            nameAlertViewHandler(title: alertTitle)
            tableView.reloadData()
            print("0")
        }
        else if indexPath.section == 1{
            alertTitle = "Location"
            locationAlertViewHandler(title: alertTitle)
            tableView.reloadData()
            print("1")
        }
        else if indexPath.section == 2{
            alertTitle = "Timezone"
            timezoneAlertViewHandler(title: alertTitle)
            tableView.reloadData()
            print("2")
        }
        else if indexPath.section == 3{
            alertTitle = "Preferrable Contact Time"
            PreferableAlertViewHandler(title: alertTitle)
            tableView.reloadData()
            print("3")
        }

        print("indexPath.section====================\(indexPath.section)")

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
        
        
        
        if indexPath.section == 0{
            cell.inputLabel.text = text1
            if text1 != defaultText1{
                cell.inputLabel.textColor = .black
            }
            else {
                cell.inputLabel.textColor = .systemGray3
            }
        }else if indexPath.section == 1{
            cell.inputLabel.text = text2
            if text2 != defaultText2{
                cell.inputLabel.textColor = .black
            }else {
                cell.inputLabel.textColor = .systemGray3
            }
        }else if indexPath.section == 2{
            cell.inputLabel.text = text3
            if text3 != defaultText3{
                cell.inputLabel.textColor = .black
            }
            else {
                cell.inputLabel.textColor = .systemGray3
            }
        }else if indexPath.section == 3{
            cell.inputLabel.text = text4
            if text4 != defaultText4{
                cell.inputLabel.textColor = .black
            }
            else {
                cell.inputLabel.textColor = .systemGray3
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return data[section].0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
   
}




struct profileVIewDataProvider {
    static func dataProvider() -> [(String, String)] {
        var data = [(String, String)]()
        data.append(("Name", Profile().name))
        data.append(("Location", Profile().Location))
        data.append(("Timezone", Profile().Timezone))
        data.append(("Preferrable Contact Time", Profile().PreferrableCountryTime))

        return data
    }
}


extension FriendsAddViewController : FriendsAddTableViewCellDelegate {

    func FriendsAddTableViewCellDelegateHandler() {
        print("delegation in cell succeeded")
    }
}




extension FriendsAddViewController: UIImagePickerControllerDelegate {
    
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select your picture?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default) { [weak self] _ in
            self?.presentCamera()
        }
        let selectPhotoAction = UIAlertAction(title: "Choose a photo", style: .default) { [weak self] _ in
            self?.presentPhotoPicker()
        }
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(takePhotoAction)
        actionSheet.addAction(selectPhotoAction)
        present(actionSheet, animated: true)
    }
    
    func presentCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    //when users chose
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        print(info)
        
        picker.dismiss(animated: true, completion: nil)
        guard let imagee = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{ return }
        imageView.image = imagee
//        spinner.show(in: view)
        
//        let alertView = UIAlertController(title: "Edit Profile picture", message: "Would you like to change your profile picture?", preferredStyle: .alert)
//        let confirmAction = UIAlertAction(title: "confirm", style: .default) { [weak self] _ in
//            self?.profileImage = image.description
//            print("image.description: \(image.description)")
//            self?.image = image
//
//        }
//
//        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
//        alertView.addAction(confirmAction)
//        alertView.addAction(cancelAction)
//
//        navigationController?.present(alertView, animated: true, completion: nil)
//        spinner.dismiss(animated: true)
   }

    // users cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
}
