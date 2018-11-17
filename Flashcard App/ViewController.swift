//
//  ViewController.swift
//  Flashcard App
//
//  Created by Sarah George on 10/13/18.
//  Copyright © 2018 Sarah George. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    @IBAction func didTapOnPrevious(_ sender: Any) {
        currentIndex = currentIndex - 1
        
        updateLabels()
        
        updateNextPrevButtons()
        
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        
        currentIndex = currentIndex + 1
        
        updateLabels()
        
        updateNextPrevButtons()
    }
    
    var currentIndex = 0

    
    var flashcards = [Flashcard]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readSavedFlashcards()
        
        if flashcards.count == 0{
            updateFlashcard(question: "What is the capital of Spain?", answer: "Madrid")
        }
        else{
            
            updateLabels()
            updateNextPrevButtons()
        }
        
    }


    @IBAction func didTapFlascard(_ sender: Any) {
        frontLabel.isHidden = true
    }
    func updateFlashcard(question: String, answer: String)  {
        let flashcard = Flashcard(question: question, answer: answer)
        
        flashcards.append(flashcard)
        
        print("Added new flsshcard")
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        
        updateLabels()
        
        saveAllFlashcardsToDisk()
        
    }
    
    func updateNextPrevButtons(){
        
        if currentIndex == flashcards.count - 1{
            
            nextButton.isEnabled = false
            }
        else{
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0{
            prevButton.isEnabled = false
        }
        else{
            prevButton.isEnabled = true
        }
        
        print(nextButton.isEnabled)
    }
    
    func updateLabels(){
        
        let currentFlashcard = flashcards[currentIndex]
        
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
    }
    
    func saveAllFlashcardsToDisk(){
        
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
            
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
    }
    
    func readSavedFlashcards(){
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
}

