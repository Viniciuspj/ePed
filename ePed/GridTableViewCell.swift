//
//  GridTableViewCell.swift
//  ePed
//
//  Created by ECX Card on 07/03/18.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

class GridTableViewCell: UITableViewCell {

    @IBOutlet weak var equipmentName: UILabel!
    @IBOutlet weak var equipmentValue: UILabel!
    @IBOutlet weak var viewEquiName: UIView!
    @IBOutlet weak var viewEquipValue: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewEquiName.layer.borderColor = UIColor.black.cgColor
        viewEquiName.layer.borderWidth = 1
        
        viewEquipValue.layer.borderColor = UIColor.black.cgColor
        viewEquipValue.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
