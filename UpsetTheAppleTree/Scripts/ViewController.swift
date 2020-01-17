//
//  ViewController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/14/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    //Need this to play audio
    var audioPlayer = AVAudioPlayer()
    
    let treeViewScript: treeViewController = treeViewController()
    
    @IBOutlet weak var chooseACategory: UILabel!
    
    var choice = -1
    //CS = 0, VG = 1, EM = 2, M = 3, S = 4, TTH = 5, P = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets up main theme so it is ready to play
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "AppelationMainTheme", ofType: "wav")!))
            audioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
        
        if(audioPlayer.isPlaying == false){
            //Tells the audioPlayer to loop an infinite number of times
            audioPlayer.numberOfLoops = -1
            //Then plays the audio
            audioPlayer.play()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let tree = segue.destination as! treeViewController
        tree.catChoice = choice
    }
    @IBAction func CSButton(_ sender: Any) {
        choice = 0
    }
    @IBAction func VGButton(_ sender: Any) {
        choice = 1
    }
    @IBAction func EMButton(_ sender: Any) {
        choice = 2
    }
    @IBAction func MButton(_ sender: Any) {
        choice = 3
    }
    @IBAction func SButton(_ sender: Any) {
        choice = 4
    }
    @IBAction func TTHButton(_ sender: Any) {
        choice = 5
    }
    @IBAction func PButton(_ sender: Any) {
        choice = 6
    }

}
