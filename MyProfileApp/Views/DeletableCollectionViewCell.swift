//
//  DeletableCollectionViewCell.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

protocol CellDeletionDelegate: AnyObject {
    func deleteSkills()
}

class DeletableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var skillLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    weak var delegate: CellDeletionDelegate?

    @IBOutlet weak var deleteButton: UIButton!
    @IBAction func deleteButtonAction(_ sender: Any) {
        delegate?.deleteSkills()
    }
    
    public func configureForAdding() {
        deleteButton.isHidden = true
    }
    
   
}
