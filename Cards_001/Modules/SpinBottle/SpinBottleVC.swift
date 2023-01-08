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
    @IBOutlet weak var backbtn: UIButton!
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
        let vc = ChooseCardsVC()
        vc.handleIshidenBt = {
                      self.leftButton.isHidden = true
                      self.rightButton.isHidden = true
                      self.imageBottle.isUserInteractionEnabled = true
                  }
        self.navigationController?.pushViewController(vc, animated: true)
        switch isSelectedType {
        case .Drink:
            vc.checkType = true
        case .Newyear:
            vc.checkType = false
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
        self.backbtn.isUserInteractionEnabled = false
        Mp3Service.shared.setupAudio(linkPath: "quay_chai.mp3")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.imageBottle.stopRotation()
            self.setIsHiddenFalse()
            self.backbtn.isUserInteractionEnabled = true
        }
    }
    
    func setIsHiddenFalse() {
        self.leftButton.isHidden = false
        self.rightButton.isHidden = false
        self.imageBottle.isUserInteractionEnabled = false
    }
    
}
