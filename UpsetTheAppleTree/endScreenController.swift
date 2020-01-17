//
//  endScreenController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/16/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit

class endScreenController: UIViewController {
    
    @IBOutlet weak var youWin: UILabel!
    @IBOutlet weak var youLose: UILabel!
    
    public var didWin: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets up labels
        youWin.center = self.view.center
        youWin.isHidden = true
        youLose.center = self.view.center
        youLose.isHidden = true
        
        //displays the one true label
        if (didWin){
            youWin.isHidden = false
        }
        else{
            youLose.isHidden = false
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
