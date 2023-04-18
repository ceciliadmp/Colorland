//
//  Music.swift
//  Colorland
//
//  Created by Cecília on 17/04/23.
//

import Foundation
import AVFoundation
import MediaPlayer
import SwiftUI

var player: AVAudioPlayer!

func music(music: String) {
    let url = Bundle.main.url(forResource: music, withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player.volume = 0.2
        player.numberOfLoops = -1
        player?.play()
        
    } catch {
        print("error")
    }
}
