//
//  ViewController.swift
//  Calculator
//
//  Created by nhool on 9/13/17.
//  Copyright © 2017 nhool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberValue:Double = 0
    var previousNumber:Double = 0
    var takeAction = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var showEquation: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if (takeAction == true) {
            
            label.text = String(sender.tag - 1)
            numberValue = Double(label.text!)!
            
            showEquation.text = showEquation.text! + String(sender.tag - 1)
            takeAction = false
            
        } else if (sender.tag == 17) {
            
            label.text = label.text! + "."
            showEquation.text = showEquation.text! + "."
            
        } else {
            
            label.text = label.text! + String(sender.tag - 1)
            numberValue = Double(label.text!)!
            
            showEquation.text = showEquation.text! + String(sender.tag - 1)
            
        }
        
    }
    
    
    @IBAction func actionButtons(_ sender: UIButton) {
     
        if (label.text != "" && sender.tag != 11 && sender.tag != 16) {
            
            previousNumber = Double(label.text!)!
            
            //if (label.text == "") {
              //  previousNumber = 0
                
            //} else if (label.text != "") {
              //  previousNumber = Double(label.text!)!
            //}
            
            if (sender.tag == 12) {             // divide
                label.text = "/"
                showEquation.text = showEquation.text! + "/"
            } else if (sender.tag == 13) {      // multiply
                label.text = "x"
                showEquation.text = showEquation.text! + "x"
            } else if (sender.tag == 14) {      // subtract
                label.text = "-"
                showEquation.text = showEquation.text! + "-"
            } else if (sender.tag == 15) {      // Add
                label.text = "+"
                showEquation.text = showEquation.text! + "+"
            }
            
            takeAction = true
            operation = sender.tag
            
        } else if (sender.tag == 16) {
            
            if (operation == 12) {
                label.text = String(previousNumber / numberValue)
                showEquation.text = showEquation.text! + "="
            } else if (operation == 13) {
                label.text = String(previousNumber * numberValue)
                showEquation.text = showEquation.text! + "="
            } else if (operation == 14) {
                label.text = String(previousNumber - numberValue)
                showEquation.text = showEquation.text! + "="
            } else if (operation == 15) {
                label.text = String(previousNumber + numberValue)
                showEquation.text = showEquation.text! + "="
            }
        } else if (sender.tag == 11) {
            label.text = "0"
            numberValue = 0
            previousNumber = 0
            operation = 0
            showEquation.text = ""
        }
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

