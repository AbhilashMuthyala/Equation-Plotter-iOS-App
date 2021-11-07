//
//  PlotController.swift
//  EquationPlotter
//
//  Created by UCA_SP on 10/13/16.
//  Copyright © 2016 UCA_SP. All rights reserved.
//

import Foundation
import UIKit


class PlotController: UIViewController {
    
    @IBOutlet var XmaxLabelpos: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var XmaxLabelneg: UILabel!
    @IBOutlet var pmaxXbutton: UILabel!
    @IBOutlet var nmaxXbutton: UILabel!
    @IBOutlet var nmaxYbutton: UILabel!
    @IBOutlet var pmaxYbutton: UILabel!
    
    
     var offset = Double(newXmax*2)/Double(newNumOfSamples)
    var x = Double(-newXmax)
    var y : Double?
    var pointsx = [Double]()
    var pointsy = [Double]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(offset)
        print(exp)
        print(newXmax)
        print(newNumOfSamples)
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        let widthImage = imageView.frame.size.width
        let heightImage = imageView.frame.size.height

        imageView.image = UIImage(named: "bg.png")
        //imageView.frame = CGRectMake(0,0,width,height)
        print(width)
        print(height)
        print(widthImage)
        print(heightImage)
        
        let x_plot_max = widthImage/2
        let y_plot_max = heightImage/2
        
        let cx =  widthImage/2
        let cy = 64 + (heightImage/2)

        // Do any additional setup after loading the view, typically from a nib.
            while (x <= Double(newXmax)) {
            let a = GCMathParser()
            let equation = exp
            a.setSymbolValue(x, forKey: "x")
            y =  a.evaluate(equation)
            pointsx.append(x)
            pointsy.append(y!)
            x += offset
                
        }
        print(pointsx)
        print(pointsy)
        let Ymax = pointsy.max()
        print(Ymax)
        for i in 0...newNumOfSamples-1
        {
            if(!pointsy[i].isNaN)
            {
                
            
            if (pointsx[i] > 0 && pointsy[i] > 0)
            {
                let x_plot = Double(cx) + ((fabs(pointsx[i])/Double(newXmax))*Double(x_plot_max))
                let y_plot = Double(cy) - ((fabs(pointsy[i])/Double(Ymax!))*Double(y_plot_max))
                let label = UILabel()
                label.frame = CGRect(x: CGFloat(x_plot), y: CGFloat(y_plot), width: 3.0, height: 3.0)
                label.backgroundColor = UIColor.red;
                self.view.addSubview(label)
            }
            else if (pointsx[i] < 0 && pointsy[i] > 0)
            {
                let x_plot = Double(cx) - ((fabs(pointsx[i])/Double(newXmax))*Double(x_plot_max))
                let y_plot = Double(cy) - ((fabs(pointsy[i])/Double(Ymax!))*Double(y_plot_max))
                let label = UILabel()
                label.frame = CGRect(x: CGFloat(x_plot), y: CGFloat(y_plot), width: 3.0, height: 3.0)
                label.backgroundColor = UIColor.red;
                self.view.addSubview(label)
            }
            else if (pointsx[i] < 0 && pointsy[i] < 0)
            {
                let x_plot = Double(cx) - ((fabs(pointsx[i])/Double(newXmax))*Double(x_plot_max))
                let y_plot = Double(cy) + ((fabs(pointsy[i])/Double(Ymax!))*Double(y_plot_max))
                let label = UILabel()
                label.frame = CGRect(x: CGFloat(x_plot), y: CGFloat(y_plot), width: 3.0, height: 3.0)
                label.backgroundColor = UIColor.red;
                self.view.addSubview(label)
            }
            else if (pointsx[i] > 0 && pointsy[i] < 0)
            {
                let x_plot = Double(cx) + ((fabs(pointsx[i])/Double(newXmax))*Double(x_plot_max))
                let y_plot = Double(cy) + ((fabs(pointsy[i])/Double(Ymax!))*Double(y_plot_max))
                let label = UILabel()
                label.frame = CGRect(x: CGFloat(x_plot), y: CGFloat(y_plot), width: 3.0, height: 3.0)
                label.backgroundColor = UIColor.red;
                self.view.addSubview(label)
            }
           
            }
        }
        
        pmaxXbutton.text = String(newXmax)
        pmaxYbutton.text = String(Ymax!)
        nmaxXbutton.text = String(-newXmax)
        nmaxYbutton.text = String(-Ymax!)


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

