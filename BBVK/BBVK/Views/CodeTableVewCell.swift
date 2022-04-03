//
//  CodeTableVewCell.swift
//  BBVK
//
//  Created by Saúl Pérez on 01/04/22.
//

import UIKit

class CodeTableVewCell: UITableViewCell {
    let textCodeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(textCodeLabel)
        textCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textCodeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textCodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textCodeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
