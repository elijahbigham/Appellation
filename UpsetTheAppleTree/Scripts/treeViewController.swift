//
//  treeViewController.swift
//  UpsetTheAppleTree
//
//  Created by Elijah Bigham (student HH) on 1/14/20.
//  Copyright © 2020 Bigham, Elijah. All rights reserved.
//

import UIKit

class treeViewController: UIViewController {
    
    var audio : AudioManager!
    
    //Categories
    let COMPSCI : [String] = ["VARIABLE", "INTEGER", "DOUBLE", "METHOD", "STACK OVERFLOW", "BOOLEAN", "BUSZA", "INSTANTIATION", "INTERFACE", "SUBCLASS", "CLASS", "SUPERCLASS", "BYTE", "COMPILER", "DATABASE", "LEAP YEAR", "BINARY", "OCTAL", "DECIMAL", "HEXADECIMAL", "ASCII", "FLOAT", "CHAR", "STRING", "DOCUMENTATION", "ERROR", "INDEX", "OUT OF BOUNDS", "PUBLIC", "PRIVATE", "STATIC", "RETURN", "HELLO WORLD"]
    let VIDEOGAMES : [String] = ["TENNIS FOR TWO", "UNDERTALE", "THE WITCHER", "ROCKET LEAGUE", "SUPER SMASH BROS", "FLAPPY BIRD", "JETPACK JOYRIDE", "CALL OF DUTY", "BEAT SABER", "GEOMETRY DASH", "APEX LEGENDS", "NINTENDO", "BLIZZARD", "EPIC GAMES", "UBISOFT", "ROCKSTAR GAMES", "CAPCOM", "BANDAI NAMCO", "GAMELOFT", "MARIO", "POKEMON", "THE LEGEND OF ZELDA", "GRAND THEFT AUTO", "RAINBOW SIX SEIGE", "MEGA MAN", "PAC MAN", "ASSASSINS CREED", "OVERWATCH", "ELECTRONIC ARTS", "LUIGI", "WARIO", "WALUIGI", "BOWSER", "SONIC", "SHADOW", "TAILS", "FIRE EMBLEM", "PEACH", "DAISY", "YOSHI"]
    let ELONMUSK : [String] = ["SPACEX", "TESLA", "JACK MA", "MARS", "CYBER TRUCK", "STANFORD", "PAYPAL", "SPACE", "IRON MAN", "REEVE", "SOLARCITY", "OPENAI"]
    let MEMES : [String] = ["FREE REAL ESTATE", "GRAPE SURGERY", "FORTNITE", "FLEX TAPE", "DOODLEBOB", "FIVE GUM", "PEPE THE FROG", "YEET", "DAB", "BOTTOM TEXT", "WWIII", "KEANU REEVES", "SPONGEBOB", "OK BOOMER", "VIBE CHECK", "BABY YODA", "DEEP FRIED", "BEE MOVIE", "BIG BRAIN", "THANOS", "CRINGE", "FLORIDA MAN", "SHREK", "GARFIELD", "REEEEEEEEEEEEEE"]
    let SPORTS : [String] = ["TCHOUKBALL", "SOCCER", "FOOTBALL", "TENNIS", "BASEBALL", "SOFTBALL", "TRACK", "BOWLING", "DARTS", "RUGBY", "CRICKET", "CROQUET", "ARCHERY", "BADMINTON", "HOCKEY", "FENCING", "BASKETBALL", "GOLF"]
    let THINGSTHATHURT : [String] = ["LEGO", "ACID", "HOT SAUCE", "SECOND PLACE", "RAP MUSIC", "CALCULUS", "PHYSICS", "LONELINESS", "BETRAYAL", "SHARK ATTACK", "GUNS", "WORDS", "WRONG ANSWER", "STREAK LOSS", "HOT SAUCE", "LOSING", "NO WIFI", "DEAD BATTERY"]
    let POKEMON : [String] = ["PIKACHU", "BULBASAUR", "IVYSAUR", "CHARMANDER", "SQUIRTLE", "CHARIZARD", "ARTICUNO", "ARCEUS", "RAYQUAZA", "PIDGEY", "BIDOOF", "EKANS", "NIDORAN", "GHASTLY", "WEEDLE", "JIGGLYPUFF", "ZUBAT", "PSYDUCK", "BELLSPROUT", "GOLEM", "ONIX", "ELECTABUZZ", "MAGIKARP", "GYARADOS", "SNORLAX", "MEWTWO", "FURRET", "RAYQUAZA", "PIPLUP", "LUCARIO", "TURTWIG", "CHIMCHAR", "CYDIQUIL", "TOTODILE", "CHIKORITA", "FEEBAS", "CATERPIE", "RATTATA", "SANDSHREW", "JIGGLYPUFF", "ZUBAT", "ODDISH", "DIGLETT", "MEOWTH", "ABRA", "KADABRA", "ALAKAZAM", "MACHOP", "MACHOKE", "GEODUDE", "VOLTORB", "EXEGGUTOR", "DITTO", "EEVEE", "ZAPDOS", "MOLTRESS", "DRATINI", "DRAGONAIR", "DRAGONITE", "TOGEPI", "SUDOWOODO", "WOBBUFFET", "STEELIX", "SKARMORY", "RAIKOU", "ENTEI", "SUICUNE", "TYRANITAR", "LUGIA", "TREECKO", "TORCHICK", "MUDKIP", "ZIGZAGOON", "WINGULL", "SHARPEDO", "WAILORD", "CAMERUPT", "FLYGON", "CASTFORM", "MILOTIC", "TROPIUS", "ABSOL", "SALAMENCE", "METAGROSS", "REGIROCK", "REGICE", "REGISTEEL", "REGIGIGAS", "LATIAS", "LATIOS", "KYOGRE", "GROUDON", "DEOXYS", "STARLY", "STARAPTOR", "SHINX", "BASTIODON", "COMBEE", "BONSLY", "GIBLE", "GABITE", "GARCHOMP", "CROAGUNK", "ABOMASNOW", "MAMOSWINE", "DIALGA", "PALKIA", "HEATRAN", "GIRATINA", "DARKRAI"]
    
    //This array is set to equal one of the above arrays and then answer is taken from this
    var chosenCategory : [String] = ["Hello World"]
    
    //Changed by the viewController script
    public var catChoice = -1
    
    //This is the label that displays the underscores and answers.
    @IBOutlet weak var textLabel: UILabel!
    
    //Desiplays category selected in tree view
    @IBOutlet weak var categoryLabel: UILabel!
    
    //Apples
    @IBOutlet weak var apple1: UIImageView!
    @IBOutlet weak var apple2: UIImageView!
    @IBOutlet weak var apple3: UIImageView!
    @IBOutlet weak var apple4: UIImageView!
    @IBOutlet weak var apple5: UIImageView!
    @IBOutlet weak var apple6: UIImageView!
    @IBOutlet weak var apple7: UIImageView!
    //END OF APPLES
    
    //This is the correct answer
    public var answer = "HELLO WORLD"
    
    //If these hit 0 you lose
    var applesLeft = 7
    
    //This is what appears on the screen
    var labelText = ""
    var letterInWord = false
    
    var canClick = true
    
    //OCCURS WHEN THE VIEW LOADS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //THIS NEEDS TO BE HERE
        ChooseAnswer(category: catChoice)
    }
    //variable for win or lose
    var didWin = false
    
    //sends win or lose to end screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let endScreen = segue.destination as! endScreenController
        endScreen.didWin = didWin
        endScreen.audio = audio
        endScreen.answerDisplayText = answer
    }
    
    //Assigns answer variable to a random word from the chosen category
    func ChooseAnswer(category : Int){
        
        switch category{
        case 0:
            chosenCategory = COMPSCI
            categoryLabel.text = "Computer Science"
        case 1:
            chosenCategory = VIDEOGAMES
            categoryLabel.text = "Video Games"
        case 2:
            chosenCategory = ELONMUSK
            categoryLabel.text = "Elon Musk"
        case 3:
            chosenCategory = MEMES
            categoryLabel.text = "Memes"
        case 4:
            chosenCategory = SPORTS
            categoryLabel.text = "Sports"
        case 5:
            chosenCategory = THINGSTHATHURT
            categoryLabel.text = "Things That Hurt"
        case 6:
            chosenCategory = POKEMON
            categoryLabel.text = "Pokemon"
        default:
            print("Something Broke")
        }
        
        //Chooses the answer from array
        print(chosenCategory.count)
        let rand = Int.random(in: 0 ..< chosenCategory.count)
        answer = chosenCategory[rand]
        print(answer)
        MakeUnderscores()
    }
    
    func MakeUnderscores(){
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
        textLabel.text = labelText
    }
    
    //Called on each button click. Makes shit happen.
    func Update(pressedLetter : Character){
        for i in 0..<answer.count{
            
            //This is for finding if the letter occurs in the string
            let currentLetterIndex = answer.index(answer.startIndex, offsetBy: i)
            let currentLetter = answer[currentLetterIndex]
            
            if (pressedLetter == currentLetter){
                letterInWord = true
            }
        }
        
        //If the letter does occur in the string
        if(letterInWord){
            //Make letters appear
            AddLetters(letter: pressedLetter)
            //Resets boolean for the next choice
            letterInWord = false
            //Then plays sound effect
            audio.playRightLetter()
        } else {
            //Make apple dissappear
            LoseApples()
            //Then plays sound effect
            audio.playLoseApple()
        }
        //THIS IS WHERE YOU WIN THE GAME
        //Checks if there are any underscores left in labelText
        let charset = CharacterSet(charactersIn: "_")
        if labelText.rangeOfCharacter(from: charset) == nil{
            canClick = false
            didWin = true
            performSegue(withIdentifier: "toEnd", sender: self)
        }
    }
    
    //This function is the most complicated thing I have coded so far in my life
    func AddLetters(letter : Character){
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
    
    func LoseApples(){
        applesLeft -= 1
        
        switch applesLeft{
        case 6:
            Animate(currentApple : apple1, dropDistance : 272)
        case 5:
            Animate(currentApple : apple2, dropDistance : 384)
        case 4:
            Animate(currentApple : apple3, dropDistance : 512)
        case 3:
            Animate(currentApple : apple4, dropDistance : 512)
        case 2:
            Animate(currentApple : apple5, dropDistance : 384)
        case 1:
            Animate(currentApple : apple6, dropDistance : 272)
        case 0:
            //THIS IS WHERE YOU LOSE THE GAME
            print("You Lose!")
            canClick = false
            didWin = false
            Animate(currentApple : apple7, dropDistance : 256)
            //Adds in delay so apple has time to animate
            DispatchQueue.main.asyncAfter(deadline:.now() + 0.7, execute: {
                self.performSegue(withIdentifier: "toEnd", sender: self)
            }
            //performSegue(withIdentifier: "toEnd", sender: self)
            )
        default:
            print("Dems weird apples")
        }
    }
    
    //THIS IS WHAT I ADDED MARCO
    func Animate(currentApple : UIImageView, dropDistance : CGFloat){
        //animates the apple falling
        UIView.animate(
            withDuration: 0.5,
            delay: 0.2,
            options: .curveEaseIn,
            animations: {
                currentApple.transform = CGAffineTransform(translationX: 0, y: dropDistance)
        },
            completion: nil
        )
        //Hides apple after certain amount of time
        DispatchQueue.main.asyncAfter(deadline:.now() + 0.9, execute: {
            currentApple.isHidden = true
        })
    }
    
    //This checks what button is pressed and acts accordingly
    @IBAction func buttonPress(sender: UIButton){
        if(canClick && sender.backgroundColor != UIColor.gray){
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
            sender.backgroundColor = UIColor.gray
        }
    }
}
