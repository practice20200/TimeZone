//
//  FriendsAddTableViewCell.swift
//  Timezone
//
//  Created by Apple New on 2022-05-23.
//

import UIKit
import Elements


class FriendsAddTableViewCell: UITableViewCell {

    lazy var textField: BaseUITextField = {
        let tf = BaseUITextField()
        tf.placeholder = "Enter"
        return tf
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
        contentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
//    func updateView(
//        textField : BaseUITextField,
//    ) {
//        textField = textField
//    }
}
