//
//  ShowInformationViewController.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 24/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

class ShowInformationViewController: UIViewController {
    
    var scaleSelected: ColorScale?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getColorValues()
        
    }

    func getColorValues()  {
        self.view.backgroundColor = scaleSelected?.color
        
        if let colorSelected = scaleSelected{
            let TapeColor = TapeColorValues(colorSelected: colorSelected)
            
            for item in TapeColor.lineValues{
                print(item)
            }
            
        } else{
            print("No color selected")
        }
    }
}
