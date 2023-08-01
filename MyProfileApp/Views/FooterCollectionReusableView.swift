//
//  FooterCollectionReusableView.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
    
        static let identifier = "FooterCollectionReusableView"
            
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.clipsToBounds = true
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
            label.textColor = .black
            return label
        }()
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(bioLabel)
        setUpConstraints()
        setUpFooter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpFooter() {
        bioLabel.text = "Experienced software engineer skilled in developing scalable and maintainable systems"
        titleLabel.text = "О себе"
    }
    
    func setUpConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        bioLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    }
    
}
