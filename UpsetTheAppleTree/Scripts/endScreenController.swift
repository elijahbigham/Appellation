//
//  endScreenController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/16/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit

class endScreenController: UIViewController {
    
    //Allows access to the AudioManager methods
    var audio: AudioManager!
    
    @IBOutlet weak var YouWin: UIImageView!
    @IBOutlet weak var YouLose: UIImageView!
    
    
    public var didWin: Bool = false
    override func viewDidLoad() {
        //Stops main theme from playing
        
        audio.stopMainTheme()
        
        super.viewDidLoad()
        //sets up end screens
        YouWin.isHidden = true
        YouLose.isHidden = true
        
        //displays the one true label
        if (didWin){
            YouWin.isHidden = false
            //Plays audio
            audio.playYouWin()
        }
        else{
            YouLose.isHidden = false
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
