//
//  ViewController.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var skills = [Skill]()
    
    private let insets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
              view.addSubview(collectionView)
        
              collectionView.delegate = self
              collectionView.dataSource = self
  
    }
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .vertical
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    

}


extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availabelWidth = view.frame.width - (insets.left)*2
        let spacing: CGFloat = 12
        let height: CGFloat = 44
        let numberOfItemsPerRow: CGFloat = 3
        //let cellWidth: CGFloat = 20
        let cellWidth = (availabelWidth - spacing*(numberOfItemsPerRow - 1)) / numberOfItemsPerRow
       return CGSize(width: cellWidth, height: height)
      }
    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
      }
    
    
}
