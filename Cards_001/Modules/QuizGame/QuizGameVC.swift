//
//  QuizGameVC.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit

class QuizGameVC: UIViewController {
    
    @IBOutlet weak var startUpBt: UIButton! {
        didSet {
            startUpBt.layer.cornerRadius = 20
            startUpBt.layer.masksToBounds = true
            startUpBt.addTarget(self, action: #selector(tapToStarUpbt), for: .touchUpInside)
        }
    }
    @IBOutlet weak var accelerationBt: UIButton! {
        didSet {
            accelerationBt.layer.cornerRadius = 20
            accelerationBt.layer.masksToBounds = true
            accelerationBt.addTarget(self, action: #selector(tapToAccelerationBt), for: .touchUpInside)
        }
    }
    @IBOutlet weak var finishBt: UIButton! {
        didSet {
            finishBt.layer.cornerRadius = 20
            finishBt.layer.masksToBounds = true
            finishBt.addTarget(self, action: #selector(tapToFinishBt), for: .touchUpInside)

        }
    }
   
    @objc func tapToStarUpbt() {
        let vc = LevelGameVC()
        vc.isCheckGameType = .easy
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapToAccelerationBt() {
        let vc = LevelGameVC()
        vc.isCheckGameType = .medium
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapToFinishBt() {
        let vc = LevelGameVC()
        vc.isCheckGameType = .hard
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func popUpBt(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    


}
