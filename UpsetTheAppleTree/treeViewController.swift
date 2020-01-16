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
    var chosenCategory : [String] = ["Hello World"]
    
    //Changed by the viewController script
    public var catChoice = -1
    
    //This is the label that displays the underscores and answers.
    @IBOutlet weak var textLabel: UILabel!
    
    //Apples
    @IBOutlet weak var apple1: UIImageView!
    @IBOutlet weak var apple2: UIImageView!
    @IBOutlet weak var apple3: UIImageView!
    @IBOutlet weak var apple4: UIImageView!
    @IBOutlet weak var apple5: UIImageView!
    @IBOutlet weak var apple6: UIImageView!
    @IBOutlet weak var apple7: UIImageView!
    //END OF APPLES
    
    //Buttons
    @IBOutlet weak var _A: UIButton!
    @IBOutlet weak var _B: UIButton!
    @IBOutlet weak var _C: UIButton!
    @IBOutlet weak var _D: UIButton!
    @IBOutlet weak var _E: UIButton!
    @IBOutlet weak var _F: UIButton!
    @IBOutlet weak var _G: UIButton!
    @IBOutlet weak var _H: UIButton!
    @IBOutlet weak var _I: UIButton!
    @IBOutlet weak var _J: UIButton!
    @IBOutlet weak var _K: UIButton!
    @IBOutlet weak var _L: UIButton!
    @IBOutlet weak var _M: UIButton!
    @IBOutlet weak var _N: UIButton!
    @IBOutlet weak var _O: UIButton!
    @IBOutlet weak var _P: UIButton!
    @IBOutlet weak var _Q: UIButton!
    @IBOutlet weak var _R: UIButton!
    @IBOutlet weak var _S: UIButton!
    @IBOutlet weak var _T: UIButton!
    @IBOutlet weak var _U: UIButton!
    @IBOutlet weak var _V: UIButton!
    @IBOutlet weak var _W: UIButton!
    @IBOutlet weak var _X: UIButton!
    @IBOutlet weak var _Y: UIButton!
    @IBOutlet weak var _Z: UIButton!
    //END OF BUTTONS
    
    //This is the correct answer
    var answer = "HELLO WORLD"
    
    //This is what appears on the screen
    var labelText = ""
    var letterInWord = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //THIS NEEDS TO BE HERE
        ChooseAnswer(category: catChoice)
    }
    //Assigns answer variable to a random word from the chosen category
    func ChooseAnswer(category : Int){
        
        switch category{
        case 0:
            chosenCategory = COMPSCI
        case 1:
            chosenCategory = VIDEOGAMES
        case 2:
            chosenCategory = ELONMUSK
        case 3:
            chosenCategory = MEMES
        case 4:
            chosenCategory = SPORTS
        case 5:
            chosenCategory = THINGSTHATHURT
        case 6:
            chosenCategory = POKEMON
        default:
            print("Something Broke")
        }
        
        //Chooses the answer from array
        let rand = Int.random(in: 0 ..< chosenCategory.count)
        answer = chosenCategory[rand]
        print(answer)
        makeUnderscores()
    }
    
    func makeUnderscores(){
        //This replaces all characters in the answer with "_ " and all spaces with a "  "
        for i in 0..<answer.count{
            
            let currentLetterIndex = answer.index(answer.startIndex, offsetBy: i)
            let currentLetter = answer[currentLetterIndex]
            
            if(currentLetter != " "){
                labelText += "_ "
            } else {
                labelText += "  "
            }
        }
        
        //Initializes the label to underscores
        print(labelText)
        textLabel.text = labelText
    }
    
    //Called on each button click. Makes shit happen.
    func Update(pressedLetter : Character){
        for i in 0..<answer.count{
            
            //This is for finding if the letter occurs in the string
            let currentLetterIndex = answer.index(answer.startIndex, offsetBy: i)
            let currentLetter = answer[currentLetterIndex]
            print(currentLetter)
            
            if (pressedLetter == currentLetter){
                letterInWord = true
            }
        }
        
        if(letterInWord){
            //Make letter appear
            print("Letter is in word")
            addLetters(letter: pressedLetter)
            
            //Resets letter in word for the next choice
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
                
                let indexToChange = labelText.index(labelText.startIndex, offsetBy: i * 2)
                
                //Will become an exact replica of label text with the new letters added
                var newLabelText = ""
                
                //This for loop adds labelText to newLabelText character by character until it gets to the index to change in which case it will add the letter of the button pressed. This gives me a headache.
                for x in 0..<labelText.count{
                    
                    let nestedCurrentLetterIndex = labelText.index(labelText.startIndex, offsetBy: x)
                    let nestedCurrentLetter = labelText[nestedCurrentLetterIndex]
                    
                    if(nestedCurrentLetterIndex != indexToChange){
                        newLabelText += String(nestedCurrentLetter)
                    } else {
                        newLabelText += String(letter)
                    }
                }
                //This is where it sets labelText to the finished newLabelText
                labelText = newLabelText
                //And then sets the text to the UI_Label to labelText
                textLabel.text = labelText
                
                //HOLY SHIT IT ACTUALLY WORKS!!!!!
            }
        }
    }
    
    //This checks what button is pressed and acts accordingly
    @IBAction func buttonPress(sender: UIButton){
        switch sender.currentTitle{
        case "A":
            Update(pressedLetter: "A")
        case "B":
            Update(pressedLetter: "B")
        case "C":
            Update(pressedLetter: "C")
        case "D":
            Update(pressedLetter: "D")
        case "E":
            Update(pressedLetter: "E")
        case "F":
            Update(pressedLetter: "F")
        case "G":
            Update(pressedLetter: "G")
        case "H":
            Update(pressedLetter: "H")
        case "I":
            Update(pressedLetter: "I")
        case "J":
            Update(pressedLetter: "J")
        case "K":
            Update(pressedLetter: "K")
        case "L":
            Update(pressedLetter: "L")
        case "M":
            Update(pressedLetter: "M")
        case "N":
            Update(pressedLetter: "N")
        case "O":
            Update(pressedLetter: "O")
        case "P":
            Update(pressedLetter: "P")
        case "Q":
            Update(pressedLetter: "Q")
        case "R":
            Update(pressedLetter: "R")
        case "S":
            Update(pressedLetter: "S")
        case "T":
            Update(pressedLetter: "T")
        case "U":
            Update(pressedLetter: "U")
        case "V":
            Update(pressedLetter: "V")
        case "W":
            Update(pressedLetter: "W")
        case "X":
            Update(pressedLetter: "X")
        case "Y":
            Update(pressedLetter: "Y")
        case "Z":
            Update(pressedLetter: "Z")
        default:
            print("Something bad happened")
        }
    }
    
    
    
}
