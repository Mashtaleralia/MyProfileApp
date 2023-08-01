//
//  ViewController.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var skills = [Skill]()
    
    private var mockData = ["MVI/MVVM", "Kotlin Coroutins", "Room", "OKHttp", "DataStore", "WorkManager", "custom view", "Data Store", "OOP Solid", "jjj", "fjdjdjdjdjjjd", "fhgfhfhfhfjfjfjfjfjf"]
    
    private let insets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
              view.addSubview(collectionView)
        
              collectionView.delegate = self
              collectionView.dataSource = self
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }
  
    }

    
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 12
//        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(UINib(nibName: "SkillCollectionViewCell", bundle: nil) , forCellWithReuseIdentifier: "SkillCollectionViewCell")
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkillCollectionViewCell", for: indexPath) as! SkillCollectionViewCell
        cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        cell.layer.cornerRadius = 10
        cell.skillLabel.text =  mockData[indexPath.item]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }
    

    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let availabelWidth = view.frame.width - (insets.left)*2
//        let spacing: CGFloat = 12
//        let height: CGFloat = 44
//        let numberOfItemsPerRow: CGFloat = 3
//        //let cellWidth: CGFloat = 20
//        let cellWidth = (availabelWidth - spacing*(numberOfItemsPerRow - 1)) / numberOfItemsPerRow
//       return CGSize(width: cellWidth, height: height)
//      }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let label = UILabel(frame: CGRect.zero)
//              label.text = "Bruuh"
//              label.sizeToFit()
//              return CGSize(width: label.frame.width, height: 44)
//    }
//    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
      }
    
    
}
