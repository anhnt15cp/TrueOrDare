//
//  HomeVC.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var boderBtTop: UIButton! {
        didSet {
            boderBtTop.layer.cornerRadius = 20
            boderBtTop.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var boderBtBot: UIButton! {
        didSet {
            boderBtBot.layer.cornerRadius = 20
            boderBtBot.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Mp3Service.shared.setupAudio(linkPath: "intro.mp3")
    }
    
    @IBAction func acctionBtTop(_ sender: UIButton) {
        let vc = ThemeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func acctionBtBot(_ sender: UIButton) {
        let vc = QuizGameVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
