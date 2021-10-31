//
//  SearchTextFieldTableViewCell.swift
//  SearchTextField
//
//  Created by Alexander Kormanovsky on 31.10.2021.
//

import UIKit

/// Mimics default cell `subtitle` style to make auto height work on iOS 10
/// - see https://stackoverflow.com/questions/50513256/uitableviewcell-height-auto-layout-not-working-on-ios-10
class SearchTextFieldTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 12)
        contentView.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = .systemFont(ofSize: 11)
        contentView.addSubview(subtitleLabel)
        
        subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor).isActive = true
    }

}
