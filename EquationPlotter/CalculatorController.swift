//
//  Calculator.swift
//  EquationPlotter
//
//  Created by UCA_SP
import Foundation
import UIKit

internal var exp: String = " "

class CalculatorController: UIViewController {
   
    @IBOutlet var equationDisplay: UITextField!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let equation = sender.currentTitle
        let equation1 = equationDisplay.text! + equation!
        equationDisplay.text = exponentize(equation1)
        exp = exp + equation!
       // var x = exponentize(exp)
        //print(x)
    }
   
    @IBAction func clearDisplayButtonPressed(_ sender: UIButton) {
        print(equationDisplay.text!)
        equationDisplay.text = nil
        exp = " "
    }
    
    @IBAction func xPowerButtonPressed(_ sender: UIButton) {
        let equation = "x^"
        equationDisplay.text = equationDisplay.text! + equation
        exp = exp + equation
    }
    
    @IBAction func sqrtPressed(_ sender: UIButton) {
        let equation = sender.currentTitle
        equationDisplay.text = equationDisplay.text! + equation! + "("
        exp = exp + "sqrt("
    }
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        let equation1 = sender.currentTitle
        equationDisplay.text = equationDisplay.text! + equation1! + "("
        exp = exp + equation1! + "("
    }
    
    @IBAction func piPressed(_ sender: UIButton) {
        let equation = sender.currentTitle
    equationDisplay.text = equationDisplay.text! + equation!
        exp = exp + "pi"
    }
    
    
    @IBAction func equationDisplayChanged(_ sender: AnyObject) {
       // exp = equationDisplay.text!
        
    }
    @IBAction func PlotButtonPressed(_ sender: UIButton) {
        
        if((equationDisplay.text!.isEmpty))
        {
            let alert = UIAlertView(title: "No Expression entered", message: "Make sure you hit back and enter Expression ", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        
        
        
       //exp = equationDisplay.text!

        //print(exp!)
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        print(newXmax)
        
        
        
        print(newNumOfSamples)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func exponentize(_ str: String) -> String {
        
        let supers = [
            "1": "\u{00B9}",
            "2": "\u{00B2}",
            "3": "\u{00B3}",
            "4": "\u{2074}",
            "5": "\u{2075}",
            "6": "\u{2076}",
            "7": "\u{2077}",
            "8": "\u{2078}",
            "9": "\u{2079}"]
        
        var newStr = ""
        var isExp = false
        for (_, char) in str.characters.enumerated() {
            if char == "^" {
                isExp = true
            } else {
                if isExp {
                    let key = String(char)
                    if supers.keys.contains(key) {
                        newStr.append(Character(supers[key]!))
                    } else {
                        isExp = false
                        newStr.append(char)
                    }
                } else {
                    newStr.append(char)
                }
            }
        }
        return newStr
    }
//Referenced :http://stackoverflow.com/questions/29225779/how-to-use-subscript-and-superscript-in-swift
}

