//
//  FriendsListCell.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import UIKit
import Elements

class FriendsListCell: UITableViewCell {
    
    lazy var profileImage: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.image = UIImage(systemName: "person.crop.circle")
        iv.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 30).isActive = true
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nameLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "NAME"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()

    lazy var sendImage: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.image = UIImage(systemName: "sun.max.fill")
        let configuration = UIImage.SymbolConfiguration(paletteColors: [.systemPurple])
        iv.preferredSymbolConfiguration = configuration
        iv.contentMode = .center
        return iv
    }()
    
    lazy var countryLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Japan"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var rightStack: HStack = {
        let stack = HStack()
        stack.spacing = 5
        stack.addArrangedSubview(sendImage)
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(countryLabel)
        return stack
    }()
    
    lazy var contentStack: HStack = {
        let stack = HStack()
        stack.addArrangedSubview(profileImage)
        stack.addArrangedSubview(rightStack)
        stack.spacing = 16
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
            contentStack.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant:  10),
            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            contentStack.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder: ) has not beeb implemented")
    }


}
