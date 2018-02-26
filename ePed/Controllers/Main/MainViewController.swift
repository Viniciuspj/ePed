//
//  MainViewController.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 20/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        
        
        var array: [String] = ["a","b","v"]
        
        var teste: [String : [String] ] = ["1":array,"3":array]
        
        print(teste["1"]![0])
        
        teste["2"] = array
        
        print(teste["1"]![1])
        
        
        
    }
    
    @IBAction func _5KgPressed(_ sender: UITapGestureRecognizer) {
        goToInformationVC()
    }
    
    func goToInformationVC(){
        
        performSegue(withIdentifier: "goToInfoSegue", sender: self)
    }
}
