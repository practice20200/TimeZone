//
//  IndividualTableViewCell.swift
//  Timezone
//
//  Created by Apple New on 2022-05-23.
//

import UIKit
import Elements

class IndividualTableViewCell: UITableViewCell {

    lazy var nameLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "John"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
//    lazy var locationLabel: BaseUILabel = {
//        let label = BaseUILabel()
//        label.text = "America"
//        label.font = UIFont.preferredFont(forTextStyle: .body)
//        return label
//    }()
//
//    lazy var timezone: BaseUILabel = {
//        let label = BaseUILabel()
//        label.text = "18:00"
//        label.font = UIFont.preferredFont(forTextStyle: .body)
//        return label
//    }()
//
//    lazy var preferrableContactTime: BaseUILabel = {
//        let label = BaseUILabel()
//        label.text = "10:00 - 22:00"
//        label.font = UIFont.preferredFont(forTextStyle: .body)
//        return label
//    }()
//
    
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
    
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(nameLabel)
//
//        NSLayoutConstraint.activate([
//            nameLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant:  15),
//            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//
//        ])
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    func setupView() {
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant:  15),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
  

}
