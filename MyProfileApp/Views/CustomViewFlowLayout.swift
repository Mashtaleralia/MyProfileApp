//
//  CustomViewFlowLayout.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit
class CustomViewFlowLayout: UICollectionViewFlowLayout {
    let cellSpacing: CGFloat = 10

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superArray = super.layoutAttributesForElements(in: rect),
                 let attributes = NSArray(array: superArray, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
            self.minimumLineSpacing = 10.0
            self.sectionInset = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 0.0, right: 16.0)
             var leftMargin = sectionInset.left
             var maxY: CGFloat = -1.0
             attributes.forEach { layoutAttribute in
                 guard layoutAttribute.representedElementCategory == .cell else {
                     return
                 }
                 guard layoutAttribute.indexPath.section == 0 else {
                     return
                 }
                 if layoutAttribute.frame.origin.y >= maxY {
                     leftMargin = sectionInset.left
                 }
                 
                 layoutAttribute.frame.origin.x = leftMargin
                 
                 leftMargin += layoutAttribute.frame.width + ((self.collectionView?.delegate as? UICollectionViewDelegateFlowLayout)?.collectionView?(self.collectionView!, layout: self, minimumInteritemSpacingForSectionAt: 0) ?? 0 ) + cellSpacing
                 maxY = max(layoutAttribute.frame.maxY , maxY)
             }
            
             return attributes
    
    }
}
