//
//  HeaderCollectionReusableView.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

private enum Constants: CGFloat {
    case cornerRadius = 60
}

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Constants.cornerRadius.rawValue
        return imageView
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.sizeToFit()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let professionLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.numberOfLines = 1
        label.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.addImageWith(name: "location", behindText: false)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .secondarySystemBackground
        self.addSubview(profileImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(professionLabel)
        self.addSubview(cityLabel)
        setUpConstraints()
    }
    
    public func setUpHeader(with model: AppUser) {
        profileImageView.image = UIImage(named: "Image")
        fullNameLabel.text = model.fullName
        professionLabel.text = model.profession
        cityLabel.text = model.city
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        professionLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16).isActive = true
        fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fullNameLabel.widthAnchor.constraint(equalToConstant: 149).isActive = true
        professionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4).isActive = true
        professionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: professionLabel.bottomAnchor).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        profileImageView.frame = CGRect(x: (self.frame.width / 2) - 60, y: (self.frame.width / 2) - 24, width: 120, height: 120)
        
    }
    
    
}
