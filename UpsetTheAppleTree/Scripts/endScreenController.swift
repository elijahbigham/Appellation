//
//  endScreenController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/16/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit

class endScreenController: UIViewController {
    
    let treeView : treeViewController = treeViewController()
    
    //Allows access to the AudioManager methods
    var audio: AudioManager!
    
    let blueColor : UInt = 0x8ecbf9
    let brownColor : UInt = 0x7a5e42
    
    @IBOutlet weak var YouWin: UIImageView!
    @IBOutlet weak var YouLose: UIImageView!
    
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet public weak var answerDisplay: UILabel!
    
    public var didWin: Bool = false
    public var answerDisplayText = ""
    
    override func viewDidLoad() {
        //Stops main theme from playing
        
        audio.stopMainTheme()
        
        super.viewDidLoad()
        //sets up end screens and labels
        YouWin.isHidden = true
        YouLose.isHidden = true
        introLabel.isHidden = true
        answerDisplay.isHidden = true
        
        //displays the one true label
        if (didWin){
            view.backgroundColor = UIColorFromRGB(rgbValue: brownColor)
            YouWin.isHidden = false
            //Plays audio
            audio.playYouWin()
        }
        else{
            view.backgroundColor = UIColorFromRGB(rgbValue: blueColor)
            YouLose.isHidden = false
            introLabel.isHidden = false
            
            answerDisplay.text = answerDisplayText
            answerDisplay.isHidden = false
            
            //Plays audio
            audio.playYouLose()
        }

        // Do any additional setup after loading the view.
    }
    
    //Takes hex number and makes rgb color from it
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
