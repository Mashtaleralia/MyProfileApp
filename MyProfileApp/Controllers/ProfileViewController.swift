//
//  ViewController.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var skills = [Skill]()
    
    private var deleting: Bool = false
    
    private var mockData = ["MVI/MVVM", "Kotlin Coroutins", "Room", "OKHttp", "DataStore", "WorkManager", "custom view", "Data Store", "OOP Solid", "jjj", "fjdjdjdjdjjjd", "fhgfhfhfhfjfjfjfjfjf"]
    
    private let insets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

    private let user = AppUser(fullName: "Иванов Иван Иванович Иванов Иван Иванович", profession: "Middle IOS-разработчик, опыт более 2-х лет", city: "Воронеж")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
              view.addSubview(collectionView)
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pencil"), style: .done , target: self, action: #selector(didTapEditButton))
        navigationItem.rightBarButtonItem?.tintColor = .black
              collectionView.delegate = self
              collectionView.dataSource = self
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }
  
    }

    @objc private func didTapEditButton() {
        deleting = true
        collectionView.reloadData()
    }
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 12
//        layout.minimumInteritemSpacing = 12
        
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)

        collectionView.register(UINib(nibName: "SkillCollectionViewCell", bundle: nil) , forCellWithReuseIdentifier: "SkillCollectionViewCell")
        collectionView.register(UINib(nibName: "DeletableCollectionViewCell", bundle: nil) , forCellWithReuseIdentifier: "DeletableCollectionViewCell")
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
        
        if deleting {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeletableCollectionViewCell", for: indexPath) as! DeletableCollectionViewCell
            cell.skillLabel.text =  mockData[indexPath.item]
            cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
            cell.layer.cornerRadius = 10
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkillCollectionViewCell", for: indexPath) as! SkillCollectionViewCell
            cell.skillLabel.text =  mockData[indexPath.item]
            cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
            cell.layer.cornerRadius = 10
            return cell
        }
        
       
        
     
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case  UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
            header.setUpHeader(with: user)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView
            return footer
        default:
            print("kek")
        }
      
      return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 287)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
}
