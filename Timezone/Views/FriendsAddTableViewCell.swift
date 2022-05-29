//
//  FriendsAddTableViewCell.swift
//  Timezone
//
//  Created by Apple New on 2022-05-23.
//

import UIKit
import Elements
import SwiftUI

protocol FriendsAddTableViewCellDelegate: AnyObject {
//    let textField = UITextField().text
//    func FriendsAddTableViewCellDelegateHandler(data: )
}

class FriendsAddTableViewCell: UITableViewCell {

    
    
//    lazy var textField: BaseUITextField = {
//        let tf = BaseUITextField()
//        tf.placeholder = "Enter"
//        return tf
//    }()
    
    lazy var inputLabel: BaseUILabel = {
        let label = BaseUILabel()
        let vc = FriendsAddViewController()
        label.text = "Enter"
        label.textColor = .systemGray3
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
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
        contentView.addSubview(inputLabel)
        NSLayoutConstraint.activate([
            inputLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            inputLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            inputLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            inputLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
//    func updateView(
//        textField : BaseUITextField,
//    ) {
//        textField = textField
//    }
}
