//
//  TermsViewController.swift
//  ePed
//
//  Created by ECX Card on 08/03/18.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
