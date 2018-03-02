//
//  MainViewController.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 20/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var view3_5kg: UIView!
    @IBOutlet weak var view6_7Kg: UIView!
    @IBOutlet weak var view8_9Kg: UIView!
    @IBOutlet weak var view10_11Kg: UIView!
    @IBOutlet weak var view12_14Kg: UIView!
    @IBOutlet weak var view15_18Kg: UIView!
    @IBOutlet weak var view19_23Kg: UIView!
    @IBOutlet weak var view24_29Kg: UIView!
    @IBOutlet weak var view30_36Kg: UIView!
    
    var scaleSelected: ColorScale?
    
    override func viewDidLoad() {
        configureViewsColors()
    }
    
    func configureViewsColors(){
        view3_5kg.backgroundColor = ColorScale.Gray.color
        view6_7Kg.backgroundColor = ColorScale.Pink.color
        view8_9Kg.backgroundColor = ColorScale.Red.color
        view10_11Kg.backgroundColor = ColorScale.Purple.color
        view12_14Kg.backgroundColor = ColorScale.Yellow.color
        view15_18Kg.backgroundColor = ColorScale.White.color
        view19_23Kg.backgroundColor = ColorScale.Blue.color
        view24_29Kg.backgroundColor = ColorScale.Orange.color
        view30_36Kg.backgroundColor = ColorScale.Green.color
        
        view15_18Kg.layer.borderColor = UIColor.black.cgColor
        view15_18Kg.layer.borderWidth = 1
    }
    
    @IBAction func getWeightValues(_ sender: UITapGestureRecognizer) {
        if let tagFromView = sender.view?.tag{
            print(tagFromView)
            setSelectedWeight(viewTag: tagFromView)
        }
    }
    
    func setSelectedWeight(viewTag: Int){
        
        
        switch(viewTag){
        case 1:
            scaleSelected = .Gray
        case 2:
            scaleSelected = .Pink
        case 3:
            scaleSelected = .Red
        case 4:
            scaleSelected = .Purple
        case 5:
            scaleSelected = .Yellow
        case 6:
            scaleSelected = .White
        case 7:
            scaleSelected = .Blue
        case 8:
            scaleSelected = .Orange
        case 9:
            scaleSelected = .Green
        default:
            scaleSelected = nil
        }
        
        goToInformationVC()
    }
    
    
    func goToInformationVC(){
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
