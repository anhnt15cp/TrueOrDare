//
//  Mp3Service.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import Foundation
import AVFoundation

class Mp3Service {
    
    static let shared = Mp3Service()
    var mp3Player: AVAudioPlayer!
    
    func setupAudio(linkPath: String?) {
        do {
            
            let path = Bundle.main.path(forResource: linkPath, ofType: nil)
            guard let path = path else {
                return
            }
            let url = URL(fileURLWithPath: path)
            
            mp3Player = try AVAudioPlayer(contentsOf: url)
            mp3Player.prepareToPlay()
            mp3Player.enableRate = true
            mp3Player.play()
            mp3Player.volume = 5.0
        }
        catch {
            print("Error")
        }
    }
}
