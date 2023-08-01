//
//  ViewController.swift
//  MyProfileApp
//
//  Created by Admin on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
  
    
    
    private var skills = [Skill(skillName: "MVI/MVVM"),Skill(skillName: "MVI/MVVM"), Skill(skillName: "MVI/MVVM"), Skill(skillName: "MVI/MVVM"), Skill(skillName: "MVI/MVVM"), Skill(skillName: "MVI/MVVM"),Skill(skillName: "MVI/MVVM"), Skill(skillName: "MVI/MVVM"), Skill(skillName: "MVI/MVVM")]
    
    private var deleting: Bool = false
    
    private var mockData = ["MVI/MVVM", "Kotlin Coroutins", "Room", "OKHttp", "DataStore", "WorkManager", "custom view", "Data Store", "OOP Solid"]
    
    private let insets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

    private let user = AppUser(fullName: "Машталер Алевтина Александровна", profession: "junior IOS-разработчик, опыт менее года", city: "Москва")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        if let data = UserDefaults.standard.array(forKey: "skills") as? [String] {
            mockData = data
        }
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
              view.addSubview(collectionView)
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pencil"), style: .done , target: self, action: #selector(didTapEditButton))
        
              collectionView.delegate = self
              collectionView.dataSource = self

       
  
    }

    @objc private func didTapEditButton() {

        deleting = true
        mockData.append("+")
        collectionView.reloadData()

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "done"), style: .done , target: self, action: #selector(didTapDoneButton))
    }

    @objc private func didTapDoneButton() {
        deleting = false
        mockData.removeLast()
        collectionView.reloadData()

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pencil"), style: .done , target: self, action: #selector(didTapEditButton))
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

extension ProfileViewController: CellDeletionDelegate {
    func deleteSkills(_ index: Int) {
        mockData.remove(at: index)
        UserDefaults.standard.set(self.mockData, forKey: "skills")
        collectionView.reloadData()
    }
    
    
    
    
}


extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if deleting {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeletableCollectionViewCell", for: indexPath) as! DeletableCollectionViewCell
            cell.skillLabel.text =  mockData[indexPath.item]
            cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
            cell.delegate = self
            cell.deleteButton?.layer.setValue(indexPath.row, forKey: "index")
            if mockData[indexPath.row] == "+" {
                cell.configureForAdding()
            }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if deleting {
            if indexPath.row == mockData.count - 1 {
                let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым владеете", preferredStyle: .alert)
                alert.addTextField(configurationHandler: { textField in
                    textField.becomeFirstResponder()
                    textField.placeholder = "Введите название"
                })
                alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { [weak self] _ in
                    let textField = alert.textFields![0] as UITextField
                    guard let path = self?.mockData.count else {
                        return
                    }
                    if let text = textField.text {
                        self?.mockData.insert(text, at: (path) - 1)
                        UserDefaults.standard.set(self?.mockData, forKey: "skills")
                    }
                    
                    collectionView.reloadData()
                }))
                alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
                present(alert, animated: true)
            }

        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }
  
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
        return CGSize(width: view.frame.width, height: 317)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
}

