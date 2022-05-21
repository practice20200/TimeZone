//
//  ViewTableCell.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import Foundation
import Elements
import UIKit

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
