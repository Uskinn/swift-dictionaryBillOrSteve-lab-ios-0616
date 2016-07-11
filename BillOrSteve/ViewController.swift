//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var factsLabel: UILabel!
    @IBOutlet weak var steveLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var steveOutlet: UIButton!
    @IBOutlet weak var billOutlet: UIButton!
    
    var steveFacts: [String] = []
    var billFacts: [String] = []
    var person: String = ""
    var actualFact: String = ""
    var counter: Int = 0
    
    var facts: [String : [String]] = [:]
    
    func createFacts() {
        
        steveFacts.append("He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.")
        steveFacts.append( "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.")
        steveFacts.append( "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.")
        steveFacts.append("He was a pescetarian, meaning he ate no meat except for fish.")
        
        billFacts.append("He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.")
        billFacts.append("He scored 1590 (out of 1600) on his SATs.")
        billFacts.append("His foundation spends more on global health each year than the United Nation's World Health Organization.")
        billFacts.append("The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.")
        billFacts.append("In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss.")
     
        facts["Steve Jobs"] = steveFacts
        facts["Bill Gates"] = billFacts
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    createFacts()
    showFact()
        
    }
    
   func showFact() {
    
    let personAndFact = getRandomFact()
    person = personAndFact.0
    actualFact = personAndFact.1
    factsLabel.text = actualFact
    
   }
    
    @IBAction func steveButton(sender: AnyObject) {
        
        if person == "Steve Jobs" {
            counter += 1
            numberLabel.text = String(counter)
        }
        showFact()
    }
    
    @IBAction func billButton(sender: AnyObject) {
        
        if person == "Bill Gates" {
            counter += 1
            numberLabel.text = String(counter)
        }
        showFact()
    }

    func getRandomFact() -> (person: String, funFact: String) {
        
        let somePerson = randomPerson()
        let somePersonAndFact = facts[somePerson]
        
        var justStirng = String()
        
        if let somePersonAndFact = somePersonAndFact {
            
            justStirng = somePersonAndFact[randomNumberFromZeroTo(somePersonAndFact.count)]
        }
        return (somePerson, justStirng)
    }
    
    
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
}
