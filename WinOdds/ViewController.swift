//
//  ViewController.swift
//  WinOdds
//
//  Created by Ֆրեդ on 7/23/19.
//  Copyright © 2019 Ֆրեդ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var price1: MyLabel!
    @IBOutlet weak var price2: MyLabel!
    @IBOutlet weak var price3: MyLabel!
    
    
    @IBOutlet weak var checkBtn: MyButton!
    @IBOutlet weak var checkLbl: UILabel!
    @IBOutlet weak var sumPrice: MyTextField!
    
    @IBOutlet weak var event1: MyTextField!
    @IBOutlet weak var event2: MyTextField!
    @IBOutlet weak var event3: MyTextField!
    
    
    var event1Value: Double = 0
    var event2Value: Double = 0
    var event3Value: Double = 0
    var priceValue: Double = 0
    
    var eventsArray:[Double] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setStatusBarStyle(.lightContent)
        
        self.checkBtn.layer.borderColor = UIColor.white.cgColor
        self.checkBtn.layer.borderWidth = 2
        self.sumPrice.delegate = self
        self.event1.delegate = self
        self.event2.delegate = self
        self.event3.delegate = self
        
        self.eventsArray = [event1Value, event2Value, event3Value]
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.sumPrice.resignFirstResponder()
        
        if textField == self.event1 {
            self.event1.resignFirstResponder()
            self.event2.becomeFirstResponder()
            if event1.text?.count == 0 || Double(event1.text!)  == nil {
                self.showAlert(message: "You must fill like 1.21")
            }
        } else if textField == self.event2 {
            self.event2.resignFirstResponder()
            self.event3.becomeFirstResponder()
            if event2.text?.count == 0 || Double(event2.text!)  == nil {
                self.showAlert(message: "You must fill like 1.21")
            }
        } else if textField == self.event3 {
            self.event3.resignFirstResponder()
            if event3.text?.count == 0 || Double(event3.text!)  == nil {
                self.showAlert(message: "You must fill like 1.21")
            }
        }
        
        event1Value = Double(self.event1.text ?? "0.0") ?? 0.0
        event2Value = Double(self.event2.text ?? "0.0") ?? 0.0
        event3Value = Double(self.event3.text ?? "0.0") ?? 0.0
        priceValue = Double(self.sumPrice.text ?? "0.0") ?? 0.0
        eventsArray = [event1Value, event2Value, event3Value]
        
        return true
    }

    @IBAction func check(_ sender: Any) {
        
        let percent = self.allPrice(self.eventsArray).roundTo(places: 2)
        
        if (percent - self.priceValue).roundTo(places: 2) > 0 {
            
            // show alert " Good!!" ""
            self.price1.textColor = UIColor(red: 102/255, green: 204/255, blue: 154/255, alpha: 1)
            self.price1.text = "\((percent / self.event1Value).roundTo(places: 2))"
            self.price2.textColor = UIColor(red: 102/255, green: 204/255, blue: 154/255, alpha: 1)
            self.price2.text = "\((percent / self.event2Value).roundTo(places: 2))"
            self.price3.textColor = UIColor(red: 102/255, green: 204/255, blue: 154/255, alpha: 1)
            self.price3.text = "\((percent / self.event3Value).roundTo(places: 2))"
            self.checkLbl.textColor = UIColor(red: 72/255, green: 255/255, blue: 52/255, alpha: 1)
            self.checkLbl.text = "+\((percent - self.priceValue).roundTo(places: 2))"
        } else {
            
            self.price1.textColor = .red
            self.price1.text = "- - -"
            self.price2.textColor = .red
            self.price2.text = "- - -"
            self.price3.textColor = .red
            self.price3.text = "- - -"
            self.checkLbl.textColor = .red
            let result = (percent - self.priceValue).roundTo(places: 2)
            print("result = \(result)")
            if result < -priceValue {
                self.checkLbl.text = "\(-priceValue)"
            } else {
                self.checkLbl.text = "\(result)"
            }
            
        }
    }
    
    func allPrice(_ eventsArray: [Double]) -> Double {
        
        let x = 1 - ((1 / event1Value) + (1 / event2Value) + (1 / event3Value))
        return priceValue * (1+x)
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title:"Skip", style: .default) { (action) in }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }

}
