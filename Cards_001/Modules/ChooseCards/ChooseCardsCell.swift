//
//  ChooseCardsCell.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit
import SDWebImage

class ChooseCardsCell: UICollectionViewCell {
    
    @IBOutlet weak var cornerRadiusView: UIView! {
        didSet {
            cornerRadiusView.layer.cornerRadius = 5
            cornerRadiusView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var backImage: UIImageView! {
        didSet {
            backImage.layer.cornerRadius = 5
            backImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var descriptionLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bindDataDrink(model: ListItemNhau) {
        let url = URL(string: model.image ?? "")
        backImage.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
        descriptionLb.text = model.cau
    }
    
    func bindDataNewYear(model: ListItemTet) {
        let url = URL(string: model.image ?? "")
        backImage.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
        descriptionLb.text = model.cau
    }
    
    func filip() {
        Mp3Service.shared.setupAudio(linkPath: "CardFlip.mp3")
        UIView.transition(from: frontImage, to: backImage, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: {_ in
        })
    
    }
    
    func filipBack() {
        UIView.transition(from: backImage, to: frontImage, duration: 0.5, options: .showHideTransitionViews) { _ in
            print("")
        }
    }
}
