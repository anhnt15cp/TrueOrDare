//
//  ChooseCardsVC.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit

class ChooseCardsVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(UINib(nibName: "ChooseCardsCell", bundle: nil), forCellWithReuseIdentifier: "ChooseCardsCell")
        }
    }
    
    var checkType: Bool = true
    private var listItemDrink: [ListItemNhau] = []
    private var listItemNewYear: [ListItemTet] = []
    private let showInfoView: ShowInfoView = .instanceFromNib()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTypeData()
    }
    
    private func checkTypeData() {
        
        switch checkType {
        case true:
            self.dataDrink()
        case false:
            self.dataNewYear()
        }
    }
    
    private func filipAgain() {
            self.listItemDrink = self.listItemDrink.shuffled()
            self.listItemNewYear = self.listItemNewYear.shuffled()
            self.collectionView.reloadData()
    }
    
    private func setUpShowInfoView() {
        showInfoView.handlePop = {
            self.navigationController?.popViewController(animated: true)
        }
        self.showInfoView.frame = self.view.frame
        self.showInfoView.zoomOut()
        self.view.addSubview(showInfoView)
    }
    
    private func dataDrink() {
        APIService.shared.getDataDrink { listItem in
            guard let listItem = listItem else {
                return
            }
            self.listItemDrink.append(contentsOf: listItem)
            self.listItemDrink = self.listItemDrink.shuffled()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func dataNewYear() {
        APIService.shared.getDataNewYear { listItem in
            guard let listItem = listItem else {
                return
            }
            self.listItemNewYear.append(contentsOf: listItem)
            self.listItemNewYear = self.listItemNewYear.shuffled()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    @IBAction func popButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ChooseCardsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseCardsCell", for: indexPath) as! ChooseCardsCell
        switch checkType {
        case true:
            cell.bindDataDrink(model: listItemDrink[indexPath.row])
        
        case false:
            cell.bindDataNewYear(model: listItemNewYear[indexPath.row])
           
        }
        return cell
    }
}

extension ChooseCardsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ChooseCardsCell
        cell.filip()
        self.collectionView.isUserInteractionEnabled = false
        showInfoView.handleFilipAgain = {
            self.filipAgain()
            cell.filipBack()
            self.collectionView.isUserInteractionEnabled = true
        }
        switch checkType {
        case true:
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                AudioService.shared.setupAudio(urlString: self.listItemDrink[indexPath.row].music)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.setUpShowInfoView()
                self.showInfoView.bindDataDrink(model: self.listItemDrink[indexPath.row])
            }
        case false:
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                AudioService.shared.setupAudio(urlString: self.listItemNewYear[indexPath.row].music)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.setUpShowInfoView()
                self.showInfoView.bindDataNewYear(model: self.listItemNewYear[indexPath.row])
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 98) / 3
        let height = (collectionView.frame.height - 172) / 4
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 100, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    
}
