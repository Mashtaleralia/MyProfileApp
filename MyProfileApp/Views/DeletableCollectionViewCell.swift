//
//  DeletableCollectionViewCell.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

protocol CellDeletionDelegate: AnyObject {
    func deleteSkills(_ index: Int)
}

class DeletableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var skillLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    weak var delegate: CellDeletionDelegate?

    @IBOutlet weak var deleteButton: UIButton!
    @IBAction func deleteButtonAction(_ sender: UIButton) {
       
        if let index = sender.layer.value(forKey: "index") as? Int {
            delegate?.deleteSkills(index)
            
        }
      
    }
    
    
    public func configureForAdding() {
        deleteButton.isHidden = true
    }
    
   
}
