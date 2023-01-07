//
//  LevelGameVC.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import UIKit
import FSPagerView
import SDWebImage

enum IsCheckGameType {
    case easy
    case medium
    case hard
}
class LevelGameVC: UIViewController {
    
    @IBOutlet weak var doneButton: UIButton! {
        didSet {
            self.doneButton.isHidden = true
            self.doneButton.layer.cornerRadius = 10
            self.doneButton.layer.masksToBounds = true
            doneButton.addTarget(self, action: #selector(tapToDoneButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var continueButton: UIButton! {
        didSet {
            continueButton.layer.cornerRadius = 10
            continueButton.layer.masksToBounds = true
            continueButton.isHidden = true
            continueButton.addTarget(self, action: #selector(tapToContinueButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var timerLb: UILabel! {
        didSet {
            timerLb.layer.cornerRadius = 10
            timerLb.layer.masksToBounds = true
            timerLb.isHidden = true
        }
    }
    @IBOutlet weak var stopButton: UIButton! {
        didSet {
            stopButton.layer.cornerRadius = 10
            stopButton.layer.masksToBounds = true
            stopButton.isHidden = true
            stopButton.addTarget(self, action: #selector(tapToStopButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 10
            startButton.layer.masksToBounds = true
            startButton.addTarget(self, action: #selector(tapToStartButton), for: .touchUpInside)
        }
    }
    @IBOutlet weak var contentView: FSPagerView! {
        didSet {
            contentView.layer.cornerRadius = 20
            contentView.layer.masksToBounds = true
            contentView.dataSource = self
            contentView.delegate = self
            contentView.register(UINib(nibName: "ContentPagerViewCell", bundle: nil), forCellWithReuseIdentifier: "ContentPagerViewCell")
            contentView.transformer = FSPagerViewTransformer(type: .crossFading)
            contentView.itemSize = CGSize(width: self.contentView.frame.width, height: self.contentView.frame.height)
        }
    }
    
    private var listItemGameEasy: [ListItemEasy] = []
    private var listItemGameMedium: [ListItemMedium] = []
    private var listItemGameHard: [ListItemHard] = []
    private var timeLeft: TimeInterval = 120
    private var timer = Timer()
    var isCheckGameType: IsCheckGameType = .easy
    
    override func viewDidLoad() {
        checkType()
    }
    
    @objc func tapToContinueButton() {
        switch isCheckGameType {
        case .easy:
            timeLeft = 30
        case .medium:
            timeLeft = 60
        case .hard:
            timeLeft = 120
        }
        self.timerLb.text = timeLeft.time
        self.continueButton.isHidden = true
        self.startButton.isHidden = false
        self.timerLb.isHidden = true
        self.stopButton.isHidden = true
        self.doneButton.isHidden = true
        self.startButton.isUserInteractionEnabled = true
        self.timer.invalidate()
        self.reloadDataCell()
    }
    
    private func reloadDataCell() {
        contentView.isUserInteractionEnabled = true
        self.listItemGameEasy = self.listItemGameEasy.shuffled()
        self.listItemGameMedium = self.listItemGameMedium.shuffled()
        self.listItemGameHard = self.listItemGameHard.shuffled()
        self.contentView.reloadData()
    }
    
    @objc func tapToDoneButton() {
        self.tapToContinueButton()
    }
    
    @objc func tapToStopButton() {
        self.timer.invalidate()
        if self.stopButton.titleLabel?.text == "Dừng" {
            self.stopButton.setTitle("Tiếp Tục", for: .normal)
        }else {
            self.stopButton.setTitle("Dừng", for: .normal)
            self.setUpTimer()
        }
        }
    
    @objc func tapToStartButton() {
        self.stopButton.setTitle("Dừng", for: .normal)
        self.setUpIsHidenFalse()
        self.setUpTimer()
        self.startButton.isUserInteractionEnabled = false
        contentView.isUserInteractionEnabled = false
    }

    private func setUpIsHidenFalse() {
        self.timerLb.isHidden = false
        self.stopButton.isHidden = false
        self.doneButton.isHidden = false
    }
    
    private func checkType() {
        switch isCheckGameType {
        case .easy:
            self.dataGameEasy()
            timeLeft = 30
        case .medium:
            self.dataGameMedium()
            timeLeft = 60
        case .hard:
            self.dataGameHard()
            timeLeft = 120
        }
        timerLb.text = timeLeft.time
    }
    
    private func setUpTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: +1, repeats: true, block: { _ in
            self.updateTimer()
        })
    }
    
    private func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            timerLb.text = timeLeft.time
        } else {
            timerLb.text = "00:00"
            self.continueButton.isHidden = false
            self.stopButton.isHidden = true
            timer.invalidate()
        }
        
        if timeLeft <= 5 {
            Mp3Service.shared.setupAudio(linkPath: "alarm.mp3")
        }
    }
    
    @IBAction func popUpBt(_ sender: Any) {
        timer.invalidate()
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension LevelGameVC: FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        switch isCheckGameType {
            
        case .easy:
            return listItemGameEasy.count
        case .medium:
            return listItemGameMedium.count
        case .hard:
            return listItemGameHard.count
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        switch isCheckGameType {
        case .easy:
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ContentPagerViewCell", at: index) as! ContentPagerViewCell
            cell.textLb?.text = listItemGameEasy[index].cau
            let url = URL(string: listItemGameEasy[index].image ?? "")
            cell.image?.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
            return cell
        case .medium:
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ContentPagerViewCell", at: index) as! ContentPagerViewCell
            cell.textLb?.text = listItemGameMedium[index].cau
            let url = URL(string: listItemGameMedium[index].image ?? "")
            cell.image?.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
            return cell
        case .hard:
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ContentPagerViewCell", at: index) as! ContentPagerViewCell
            cell.textLb?.text = listItemGameHard[index].cau
            let url = URL(string: listItemGameHard[index].image ?? "")
            cell.image?.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
            return cell
        }
    }
}

extension LevelGameVC: FSPagerViewDelegate {
    
}

extension LevelGameVC {
    
    private func dataGameEasy() {
        APIService.shared.gameEasy { listItem in
            guard let listItem = listItem else {
                return
            }
            self.listItemGameEasy.append(contentsOf: listItem)
            self.listItemGameEasy = self.listItemGameEasy.shuffled()
            self.contentView.reloadData()
        }
       
    }
    
    private func dataGameMedium() {
        APIService.shared.gameMedium { listItem in
            guard let listItem = listItem else {
                return
            }
            self.listItemGameMedium.append(contentsOf: listItem)
            self.listItemGameMedium = self.listItemGameMedium.shuffled()
            self.contentView.reloadData()
        }
    }
    
    private func dataGameHard() {
        APIService.shared.gameHard { listItem in
            guard let listItem = listItem else {
                return
            }
            self.listItemGameHard.append(contentsOf: listItem)
            self.listItemGameHard = self.listItemGameHard.shuffled()
            self.contentView.reloadData()
        }
    }
    
}
