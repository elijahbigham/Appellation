//
//  AudioManager.swift
//  UpsetTheAppleTree
//
//  Created by Julian Greenawalt (student HH) on 1/17/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import Foundation
import AVFoundation

class AudioManager {
    
    //variable that holds the main theme song
    var mainTheme = AVAudioPlayer()
    
    public func playMainTheme(){
        //Sets up main theme so it is ready to play
        do {
            mainTheme = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "AppelationMainTheme", ofType: "wav")!))
            mainTheme.prepareToPlay()
        } catch {
            print(error)
        }
        
        //Tells the audioPlayer to loop an infinite number of times
        mainTheme.numberOfLoops = -1
        //Then plays the audio
        mainTheme.play()
    }
    
    public func stopMainTheme(){
        //stops playing the main theme
        mainTheme.stop()
    }
    
}
