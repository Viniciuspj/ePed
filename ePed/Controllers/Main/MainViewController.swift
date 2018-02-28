//
//  MainViewController.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 20/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var scaleSelected: ColorScale?
    
    override func viewDidLoad() { 
    }
    
    @IBAction func get35KgValues(_ sender: UITapGestureRecognizer) {
        goToInformationVC(scaleSelected: .Gray)
    }
    
    @IBAction func get67KgValues(_ sender: UITapGestureRecognizer) {
        goToInformationVC(scaleSelected: .Pink)
    }
    
    @IBAction func get89KgValues(_ sender: UITapGestureRecognizer) {
        goToInformationVC(scaleSelected: .Red)
    }
    
    func goToInformationVC(scaleSelected: ColorScale){
        self.scaleSelected = scaleSelected
        performSegue(withIdentifier: "goToInfoSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ShowInformationViewController{
            let showInfoVC = segue.destination as? ShowInformationViewController
            
            if let scaleSeleted = self.scaleSelected{
                showInfoVC?.scaleSelected = scaleSeleted
            }
        }
        
    }
    
}
