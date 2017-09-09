//
//  InitialViewController.swift
//  NTTComApp
//
//  Created by TAKU on 2017/09/09.
//  Copyright © 2017年 NttCmmApp. All rights reserved.
//

import UIKit
import SkyWay

class InitialViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var roomIDTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpSkyway()
        
        roomIDTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpSkyway(){
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
