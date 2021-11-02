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

    /// Mimics `layoutMargins` to make custom insets work on iOS 10. Use instead of `layoutMargins`.
    var margins: UIEdgeInsets {
        get {
            guard let topAnchorConstraint = topAnchorConstraint,
                  let leadingAnchorConstraint = leadingAnchorConstraint,
                  let bottomAnchorConstraint = bottomAnchorConstraint,
                  let trailingAnchorConstraint = trailingAnchorConstraint else {
                return .zero
            }

            return UIEdgeInsets(
                    top: topAnchorConstraint.constant,
                    left: leadingAnchorConstraint.constant,
                    bottom: bottomAnchorConstraint.constant,
                    right: trailingAnchorConstraint.constant)
        }
        set {
            topAnchorConstraint?.constant = newValue.top
            leadingAnchorConstraint?.constant  = newValue.left
            bottomAnchorConstraint?.constant = -newValue.bottom
            trailingAnchorConstraint?.constant = newValue.right
        }
    }

    var titleLabel: UILabel!
    var subtitleLabel: UILabel!

    private var topAnchorConstraint: NSLayoutConstraint?
    private var leadingAnchorConstraint: NSLayoutConstraint?
    private var bottomAnchorConstraint: NSLayoutConstraint?
    private var trailingAnchorConstraint: NSLayoutConstraint?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.setContentHuggingPriority(.defaultHigh + 1, for: .vertical)
        contentView.addSubview(titleLabel)

        leadingAnchorConstraint = titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        leadingAnchorConstraint!.isActive = true
        trailingAnchorConstraint = titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        trailingAnchorConstraint!.isActive = true
        topAnchorConstraint = titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        topAnchorConstraint!.isActive = true

        subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = .systemFont(ofSize: 11)
        contentView.addSubview(subtitleLabel)

        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        bottomAnchorConstraint = subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomAnchorConstraint!.isActive = true

        titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor).isActive = true
    }
}
