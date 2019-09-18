//
//  ViewController.swift
//  SettingsBundle
//
//  Created by Юрий on 15.09.2019.
//  Copyright © 2019 llo8. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var text: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadInfo()
    }
    
    @IBAction func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func reloadInfo() {
        var message:String = ""
        let dictionary = UserDefaults.standard.dictionaryRepresentation()
        
        for (key, value) in dictionary {
            if (key.hasPrefix("settings_")) {
                message += "\(key): \(value)\n"
            }
        }
        
        text.text = message
    }
}

