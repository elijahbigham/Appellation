//
//  treeViewController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/14/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit

class treeViewController: UIViewController {

    //Categories
    let COMPSCI : [String] = ["VARIABLE", "INTEGER", "DOUBLE", "METHOD", "STACK OVERFLOW", "BOOLEAN", "BUSZA", "INSTANTIATION", "INTERFACE", "SUBCLASS", "CLASS", "SUPERCLASS"]
    let VIDEOGAMES : [String] = ["TENNIS FOR TWO", "UNDERTALE", "THE WITCHER", "ROCKET LEAGUE", "SUPER SMASH BROS", "FLAPPY BIRD", "JETPACK JOYRIDE", "CALL OF DUTY", "BEAT SABER", "GEOMETRY DASH"]
    let ELONMUSK : [String] = ["SPACEX", "TESLA", "JACK MA", "MARS", "CYBER TRUCK", "STANFORD", "PAYPAL", "SPACE", "IRON MAN", "ALIBABA INTELLIGENCE"]
    let MEMES : [String] = ["ITS FREE REAL ESTATE", "GRAPE SURGERY", "FORTNITE", "FLEX TAPE", "NIHOYMENYOIMENYOI", "STIMULATE YOUR SENSES"]
    let SPORTS : [String] = ["TCHOUKBALL", "SOCCER", "FOOTBALL", "TENNIS", "BASEBALL", "SOFTBALL", "TRACK", "BOWLING", "DARTS", "RUGBY", "CRICKET", "CROQUET"]
    let THINGSTHATHURT : [String] = ["LEGO", "ACID", "HOT SAUCE", "SECOND PLACE", "RAP MUSIC", "CALCULUS", "PHYSICS"]
    let POKEMON : [String] = ["PIKACHU", "BULBASAUR", "CHARMANDER", "SQUIRTLE", "CHARIZARD", "ARTICUNO", "ARCEUS", "RAYQUAZA", "PIDGEY", "BIDOOF", "EKANS", "NIDORAN", "GHASTLY"]
    
    //This array is set to equal one of the above arrays and then answer is taken from this
    var chosenCategory : [String] = []
    
    @IBOutlet weak var UI_Label: UILabel!
    
    var answer = "HELLO WORLD"
    var labelText = "This text will be replaced with answer"
    var letterInWord = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //answer = ChooseAnswer(category : num)
        labelText = answer
    }
    //Assigns answer variable to a random word from the chosen category
    func ChooseAnswer(category : Int) -> String{
        
        switch category{
        case 1:
            chosenCategory = COMPSCI
        case 2:
            chosenCategory = VIDEOGAMES
        case 3:
            chosenCategory = ELONMUSK
        case 4:
            chosenCategory = MEMES
        case 5:
            chosenCategory = SPORTS
        case 6:
            chosenCategory = THINGSTHATHURT
        case 7:
            chosenCategory = POKEMON
        default:
            answer = "RANDOM WORD"
        }
        
        //Random number to select answer from array
        let rand = Int.random(in: 0 ..< chosenCategory.count)
        
        return chosenCategory[rand]
    }
    
    //Called on each button click. Makes shit happen.
    func Update(targetLetter : Character){
        for i in 0..<answer.count{
            
            //This is for finding if the letter occurs in the string
            let currentLetterIndex = answer.index(answer.startIndex, offsetBy: i)
            let currentLetter = answer[currentLetterIndex]
            print(currentLetter)
            
            if (targetLetter == currentLetter){
                letterInWord = true
            }
        }
        
        if(letterInWord){
            //Make letter appear
            print("Letter is in word")
            addLetters(letter: targetLetter)
            letterInWord = false
        } else {
            //Make apple dissappear
            print("Lose an apple")
        }
    }
    
    func addLetters(letter : Character){
        for i in 0..<answer.count{
            
            //This is for inserting the letter in the label.
            let currentLetterIndex = answer.index(answer.startIndex, offsetBy: i)
            let currentLetter = answer[currentLetterIndex]
            print(currentLetter)
            
            if (letter == currentLetter){
                letterInWord = true
            }
        }
    }
    
    @IBAction func E_Button(_ sender: Any) {
        Update(targetLetter: "E")
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
