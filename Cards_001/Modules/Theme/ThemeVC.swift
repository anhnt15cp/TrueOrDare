//
//  ThemeVC.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit

class ThemeVC: UIViewController {
    
    @IBOutlet weak var boderBtLeft: UIButton! {
        didSet {
            boderBtLeft.layer.cornerRadius = 20
            boderBtLeft.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var boderBtRight: UIButton! {
        didSet {
            boderBtRight.layer.cornerRadius = 20
            boderBtRight.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func PopButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func chuenhChoangbtn(_ sender: Any) {
        let vc = SpinBottleVC()
        vc.isSelectedType = .Drink
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tetbtn(_ sender: Any) {
        let vc = SpinBottleVC()
        vc.isSelectedType = .Newyear
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
