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
    var rightLetter = AVAudioPlayer()
    var loseApple = AVAudioPlayer()
    
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
        //Sets the volume
        mainTheme.volume = 1
        //Then plays the audio
        mainTheme.play()
    }
    
    public func playRightLetter(){
        //Sets up the right letter sound effect so it is ready to play
        do {
            rightLetter = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "RightLetter", ofType: "wav")!))
            rightLetter.prepareToPlay()
        } catch {
            print(error)
        }
        //Sets volume of sound effect to avoid ear rape
        rightLetter.volume = 0.1
        //Then plays audio once
        rightLetter.play()
    }
    
    public func playLoseApple(){
        //Sets up the right letter sound effect so it is ready to play
        do {
            loseApple = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "LoseApple", ofType: "wav")!))
            loseApple.prepareToPlay()
        } catch {
            print(error)
        }
        //Sets volume of sound effect to avoid ear rape
        loseApple.volume = 0.4
        //Then plays audio once
        loseApple.play()
    }
    
    public func stopMainTheme(){
        //stops playing the main theme
        mainTheme.stop()
    }
    
    public func stopRightLetter(){
        rightLetter.stop()
    }
    
    public func stopLoseApple(){
        loseApple.stop()
    }
    
}
