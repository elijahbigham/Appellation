//
//  ViewController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/14/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    let treeViewScript: treeViewController = treeViewController()
    
    
    @IBOutlet weak var chooseACategory: UILabel!
    
    var choice = -1
    //CS = 0, VG = 1, EM = 2, M = 3, S = 4, TTH = 5, P = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func CSButton(_ sender: Any) {
        treeViewScript.ChooseAnswer(category : 0)
    }
    @IBAction func VGButton(_ sender: Any) {
        treeViewScript.ChooseAnswer(category : 1)
    }
    @IBAction func EMButton(_ sender: Any) {
        treeViewScript.ChooseAnswer(category : 2)
    }
    @IBAction func MButton(_ sender: Any) {
        treeViewScript.ChooseAnswer(category : 3)
    }
    @IBAction func SButton(_ sender: Any) {
        treeViewScript.ChooseAnswer(category : 4)
    }
    @IBAction func TTHButton(_ sender: Any) {
        treeViewScript.ChooseAnswer(category : 5)
    }
    @IBAction func PButton(_ sender: Any) {
        treeViewScript.ChooseAnswer(category : 6)
    }
    
}
