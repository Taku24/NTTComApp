//
//  InitialViewController.swift
//  NTTComApp
//
//  Created by TAKU on 2017/09/09.
//  Copyright © 2017年 NttCmmApp. All rights reserved.
//

import UIKit
import SkyWay

class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpSkyway()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpSkyway(){
        let option: SKWPeerOption = SKWPeerOption.init();
        option.key = "ff7b67c5-07e0-4fbc-9130-2895edb9480c"
        option.domain = "nttcomapp"
    }
    
}
