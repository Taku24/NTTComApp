//
//  SyncViewController.swift
//  NTTComApp
//
//  Created by TAKU on 2017/09/09.
//  Copyright © 2017年 NttCmmApp. All rights reserved.
//

import UIKit

class SyncViewController: UIViewController {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        indicator.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
