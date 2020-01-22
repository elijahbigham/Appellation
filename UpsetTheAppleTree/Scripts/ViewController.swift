//
//  ViewController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/14/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    //Allows access to the treeViewController methods
    let treeViewScript: treeViewController = treeViewController()
    
    //Allows access to the AudioManager methods
    let audio: AudioManager = AudioManager()
    
    @IBOutlet weak var chooseACategory: UILabel!
    
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!
    //keeps track of wins and loses
    static var numWins = 0
    static var numLosses = 0
    
    var choice = -1
    //CS = 0, VG = 1, EM = 2, M = 3, S = 4, TTH = 5, P = 6
    
    struct requirement{
        var deleteme: Int;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Starts the main theme
        audio.playMainTheme()
        winsLabel.text = String(ViewController.numWins)
        losesLabel.text = String(ViewController.numLosses)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let tree = segue.destination as! treeViewController
        tree.catChoice = choice
        tree.audio = audio
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
