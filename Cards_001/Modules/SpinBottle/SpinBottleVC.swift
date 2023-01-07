//
//  SpinBottleVC.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit

enum IsSelectedType {
    case Drink
    case Newyear
}

class SpinBottleVC: UIViewController {
    @IBOutlet weak var imageBottle: UIImageView! {
        didSet {
            imageBottle.isUserInteractionEnabled = true
            imageBottle.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapToImageBottle)))
        }
    }
    @IBOutlet weak var leftButton: UIButton! {
        didSet {
            leftButton.isHidden = true
        }
    }
    @IBOutlet weak var rightButton: UIButton! {
        didSet {
            rightButton.isHidden = true
            rightButton.layer.cornerRadius = 8
            rightButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var textLabel: UILabel!
    
    var isSelectedType: IsSelectedType = .Drink
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setSpinBottel() {
        imageBottle.startRotation(duration: 1.0, repeatCount: .infinity, clockwise: true)
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        self.setSpinBottel()
        self.leftButton.isHidden = true
        self.rightButton.isHidden = true
        Mp3Service.shared.setupAudio(linkPath: "spin.mp3")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.imageBottle.stopRotation()
            self.setIsHiddenFalse()
        }
        
    }
    
    @IBAction func rightButton(_ sender: Any) {
        switch isSelectedType {
        case .Drink:
            let vc = ChooseCardsVC()
            vc.checkType = true
            self.navigationController?.pushViewController(vc, animated: true)
        case .Newyear:
            let vc = ChooseCardsVC()
            vc.checkType = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func popButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SpinBottleVC {
    
    @objc func tapToImageBottle() {
        setSpinBottel()
        self.textLabel.isHidden = true
        Mp3Service.shared.setupAudio(linkPath: "quay_chai.mp3")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.imageBottle.stopRotation()
            self.setIsHiddenFalse()
            self.imageBottle.isUserInteractionEnabled = false
        }
    }
    
    func setIsHiddenFalse() {
        self.leftButton.isHidden = false
        self.rightButton.isHidden = false
    }
    
}
