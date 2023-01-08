//
//  ViewController.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageGif: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        autoNextHomeVC()
        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
   
    func autoNextHomeVC() {
        let gif = UIImage.gifImageWithName("luckycat2")
        imageGif.image = gif
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let vc = HomeVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

