//
//  DeletableCollectionViewCell.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

class DeletableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var skillLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func deleteButtonAction(_ sender: Any) {
    }
}
