//
//  ViewController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/14/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var choice = -1
    //Indictates which option the user has selected
    //Animal = 0, Food = 1, Sports = 2, Celestial Bodies = 3
    @IBOutlet weak var chooseAButton: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AnimalButton(_ sender: Any) {
        choice = 0
    }
    
    @IBAction func FoodButton(_ sender: Any) {
        choice = 1
    }
    @IBAction func SportsButton(_ sender: Any) {
        choice = 2
    }
    @IBAction func CelestialBodiesButton(_ sender: Any) {
        choice = 3
    }
}

