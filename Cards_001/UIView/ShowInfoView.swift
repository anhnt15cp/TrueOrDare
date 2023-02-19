//
//  ShowInfoView.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit

class ShowInfoView: UIView {
    
    @IBOutlet weak var catcat: UIImageView! {
        didSet {
            let gif = UIImage.gifImageWithName("cat2")
            catcat.image = gif
        }
    }
    
    var handlePop: (()->Void)?
    var handleFilipAgain: (()->Void)?
    
    class func instanceFromNib() -> ShowInfoView {
            return UINib(nibName: "ShowInfoView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ShowInfoView
        }
    
    @IBOutlet weak var centerView: UIView! {
        didSet {
            centerView.layer.cornerRadius = 15
            centerView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var leftButton: UIButton! {
        didSet {
            leftButton.layer.cornerRadius = 10
            leftButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var rightButton: UIButton! {
        didSet {
            rightButton.layer.cornerRadius = 10
            rightButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.backgroundColor = .gray.withAlphaComponent(0.8)
        }
    }

    @IBAction func leftButton(_ sender: UIButton) {
        self.handleFilipAgain?()
//        AudioService.shared.stopMusic()
        self.removeFromSuperview()
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
//        AudioService.shared.stopMusic()
        self.handlePop?()
    }
    
    override func draw(_ rect: CGRect) {
        imageViews.layer.cornerRadius = 10
        imageViews.layer.masksToBounds = true
    }
    
    func bindDataDrink(model: ListItemNhau) {
        let url = URL(string: model.image ?? "")
        imageViews.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
        descriptionLb.text = model.cau
    }
    
    func bindDataNewYear(model: ListItemTet) {
        let url = URL(string: model.image ?? "")
        imageViews.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
        descriptionLb.text = model.cau
    }
    
    
}
