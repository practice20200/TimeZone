//
//  Categolize.swift
//  Timezone
//
//  Created by Apple New on 2022-05-27.
//

import Foundation
import UIKit
import Elements

class CategolizedFriendGroupViewControllerCell: UITableViewCell {
    
    lazy var firstProfileImage: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.image = UIImage(systemName: "person.crop.circle")
        iv.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nameLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Friend Name"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    
    lazy var arrowImageView: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.contentMode = .center
        iv.clipsToBounds = true
        return iv
    }()
    

    
    lazy var profilePictureContentStack: HStack = {
        let stack = HStack()
        stack.addArrangedSubview(firstProfileImage)
        stack.addArrangedSubview(nameLabel)
        stack.spacing = 10
        stack.isLayoutMarginsRelativeArrangement = true
//        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stack
    }()
    

    lazy var contentStack: HStack = {
        let stack = HStack()
        stack.addArrangedSubview(profilePictureContentStack)
        stack.addArrangedSubview(arrowImageView)
        stack.isLayoutMarginsRelativeArrangement = true
//        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stack
    }()
    
    lazy var gradientLayer : CAGradientLayer = {
        let color = CAGradientLayer()
        color.colors = [
            UIColor(red: 48.0/255.0, green: 35.0/255.0, blue: 174.0/255.0, alpha: 1.0).cgColor,
               UIColor(red: 200.0/255.0, green: 109.0/255.0, blue: 215.0/255.0, alpha: 1.0).cgColor
        ]
        return color
    }()
    
    lazy var uiView : UIView = {
        let uiView = UIView(frame: CGRect(x: 0, y: 0, width: uiView.frame.size.width, height:  uiView.frame.size.height))
        uiView.layer.addSublayer(gradientLayer)
        return uiView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant:  15),
            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentStack.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder: ) has not beeb implemented")
    }

}
