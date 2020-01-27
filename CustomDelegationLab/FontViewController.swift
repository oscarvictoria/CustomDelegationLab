//
//  FontViewController.swift
//  CustomDelegationLab
//
//  Created by Oscar Victoria Gonzalez  on 1/27/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

protocol FontSize: AnyObject {
    func changeSize(_ fontVC: FontViewController, fontSize: Float)
}

class FontViewController: UIViewController {
    
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var theSlider: UISlider!
    @IBOutlet weak var theStepper: UIStepper!
    
    weak var delegate: FontSize?
    
    var test = 1
    

    
    
    var font: Double = 0 {
        didSet {

            delegate?.changeSize(self, fontSize: Float(font))
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configuredStepper()
        configuredSlider()
        changeColor()
    }
    
    func configuredStepper() {
        theStepper.minimumValue = 1
        theStepper.maximumValue = 45
        theStepper.stepValue = 1
        theStepper.value = font
    }
    
    
    func configuredSlider() {
        theSlider.minimumValue = 1
        theSlider.maximumValue = 45
        theSlider.value = Float(font)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        font = Double(sender.value)
        updatedLabel.font = UIFont.systemFont(ofSize: CGFloat(theSlider!.value))
        updatedLabel.text = "Font size: \(Int(font))"
    }
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        font = sender.value
        updatedLabel.font = UIFont.systemFont(ofSize: CGFloat(theStepper!.value))
        theSlider.value = Float(theStepper.value)
        updatedLabel.text = "Font size: \(Int(font))"
    }
    
    func changeColor() {
        if test == 1 {
            view.backgroundColor = .orange
        } else {
            view.backgroundColor = .red
        }
    }
    
    
    
}
