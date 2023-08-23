//
//  LoosesTableViewCell.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import UIKit

class LoosesTableViewCell: UITableViewCell {

    static let identifier = String(describing: LoosesTableViewCell.self)
    
    private let containerView: UIView = {
            let container = UIView()
            container.clipsToBounds = true
            container.translatesAutoresizingMaskIntoConstraints = false
            container.contentMode = .scaleAspectFill
            container.backgroundColor = .white
            container.layer.cornerRadius = 20
            return container
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 48, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.up.right")
        imageView.tintColor = .mainGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func configure(title: String, count: Int) {
        self.titleLabel.text = title
        self.countLabel.text = "\(count)"
        self.backgroundColor = .mainGreen
    }
    
    private func setupConstraints() {
        self.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(arrowImageView)
        containerView.addSubview(countLabel)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
       
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 22),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),

            countLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            countLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -31),
            
            arrowImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
//            arrowImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -66)
        ])
    }
}
