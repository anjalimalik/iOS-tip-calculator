//
//  ViewController.swift
//  tiptab
//
//  Created by Anjali Malik on 12/31/17.
//  Copyright © 2017 Anjali Malik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var splitBetweenSlider: UISlider!
    @IBOutlet weak var splitBetweenLabel: UILabel!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the Navigation Bar
        self.title = "TipTab"
        
        billText.becomeFirstResponder()
        
        //self.view.backgroundColor = UIColor.
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // This ensures that tapping on any space other than the text field will result in dissmisal of the keyboard
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // return 0 if bill text is nil
        let bill = Double(billText.text!) ?? 0
        let tipPercentage = Int((100*tipPercentageSlider.value))
        let persons = Int(splitBetweenSlider.value)
        
        
        let tip = (bill * (Double(tipPercentage) * 0.01))/Double(persons)
        let total = (bill + tip)/Double(persons)
        
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
        tipPercentageLabel.text = String(format: "%d%%", tipPercentage)
        
        if(persons == 1){
            splitBetweenLabel.text = String(format: "%d person", persons)
        } else {
            splitBetweenLabel.text = String(format: "%d persons", persons)
        }
        
        
    }
}

