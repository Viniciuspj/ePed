//
//  ShowInformationViewController.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 24/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

class ShowInformationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var kgSelected: UILabel!
    @IBOutlet weak var resuscitationText: UILabel!
    @IBOutlet weak var codeByColorText: UILabel!
    
    var scaleSelected: ColorScale?
    var tapeColor: TapeColorValues?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        getColorValues()
        prepareLayout()
    }
    
    func prepareTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.estimatedRowHeight = 90.0
    }
    
    func prepareLayout(){
        resuscitationText.text = DataLoaderStrings.resuscitationTitle.localized
        codeByColorText.text = DataLoaderStrings.codedByColorTitle.localized
        
    }
    
    func getColorValues()  {
        
        if let colorSelected = scaleSelected{
            kgSelected.text = colorSelected.rawValue
            
            tapeColor = TapeColorValues(colorSelected: colorSelected)
            
            for item in tapeColor!.lineValues{
                print(item)
            }
            
        } else{
            print("No color selected")
        }
    }
}

extension ShowInformationViewController: UITableViewDelegate, UITableViewDataSource{
    
    //Equipamento|Item
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tapeColor!.numberOfScaleLines
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GridTableViewCell
        
        cell.equipmentName.text = tapeColor?.equipmentNames[indexPath.row]
        cell.equipmentValue.text = tapeColor?.lineValues[indexPath.row]
        
        cell.viewEquiName.backgroundColor = scaleSelected?.color
        cell.viewEquipValue.backgroundColor = scaleSelected?.color
    
        return cell
    }
    
  
}
