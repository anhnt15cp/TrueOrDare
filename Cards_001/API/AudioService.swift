//
//  AudioService.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import Foundation
import AVFoundation


class AudioService {
    
    static let shared = AudioService()
    var audioPlayed: AVAudioPlayer!
    
    func setupAudio(urlString: String?) {
        let url = URL(string: urlString ?? "")
        guard let url = url else {
            return
        }
        downloadFileFromURL(url: url)
    }
    
    private func downloadFileFromURL(url: URL){
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url) { (url, response, error) in
            guard let url = url else {
                return
            }
            self.play(url: url)
        }
        downloadTask.resume()
    }
    
    private func play(url:URL) {
        do {
            audioPlayed = try AVAudioPlayer(contentsOf: url as URL)
            audioPlayed.prepareToPlay()
            audioPlayed.volume = 7.0
            audioPlayed.play()
        } catch let error as NSError {
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
}

