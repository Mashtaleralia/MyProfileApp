//
//  SkillCollectionViewCell.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var skillLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 12
    }
    
    

}
