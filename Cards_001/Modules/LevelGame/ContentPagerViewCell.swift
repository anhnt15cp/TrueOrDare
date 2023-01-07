//
//  ContentPagerViewCell.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit
import FSPagerView

class ContentPagerViewCell: FSPagerViewCell {
    
    @IBOutlet weak var textLb: UILabel!
    @IBOutlet weak var image: UIImageView! {
        didSet {
            self.image.layer.cornerRadius = 8
            self.image.layer.masksToBounds = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
