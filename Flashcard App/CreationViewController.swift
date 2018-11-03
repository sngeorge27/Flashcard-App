//
//  CreationViewController.swift
//  Flashcard App
//
//  Created by Sarah George on 10/27/18.
//  Copyright © 2018 Sarah George. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
   
    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questionTextField.text
        
        let answerText = answerTextField.text
        
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
