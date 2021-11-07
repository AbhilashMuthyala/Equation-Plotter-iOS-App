//
//  ConfigurationController.swift
//  EquationPlotter
//
//  Created by UCA_SP on 10/18/16.
//  Copyright © 2016 UCA_SP. All rights reserved.
//

import Foundation
import UIKit
internal var newXmax = 5.0
internal var newNumOfSamples = 50


class ConfigurationController: UIViewController {
    @IBOutlet var setXmax: UITextField!
    @IBOutlet var setNumOfSamples: UITextField!
    @IBOutlet var setConfiguration: UIButton!
    @IBOutlet var setStatus: UILabel!
    
    @IBAction func ConfigurationSet(_ sender: UIButton) {
        setParameters()
        setStatus.text = "set to new configuration X-max : \(newXmax) # of Samples : \(newNumOfSamples)"
    }
    func setParameters()
    {
        let text: String? = setXmax.text
         newXmax = Double(text!)!

        let text1: String? = setNumOfSamples.text
        newNumOfSamples = Int(text1!)!

        print(newXmax)
        print(newNumOfSamples)
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
      if(segue.identifier == "set")
      {
        var cc = segue.destinationViewController as! CalculatorController
    
        }
    }*/
    
}

