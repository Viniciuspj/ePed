//
//  TapeCodes.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 24/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

enum ColorScale: String {
    case Equipment = "0"
    case Gray = "3-5kg"
    case Pink = "6-7kg"
    case Red = "8-9kg"
    case Purple = "10-11kg"
    case Yellow = "12-14kg"
    case White = "15-18kg"
    case Blue = "19-23kg"
    case Orange = "24-29kg"
    case Green = "30-36kg"
    
    var color: UIColor{
        switch self {
        case .Gray:
            return UIColor(red: 129/255, green: 128/255, blue: 126/255, alpha: 1)
        case .Pink:
            return UIColor(red: 194/255, green: 144/255, blue: 164/255, alpha: 1)
        case .Red:
            return UIColor(red: 129/255, green: 12/255, blue: 34/255, alpha: 1)
        case .Purple:
            return UIColor(red: 74/255, green: 30/255, blue: 107/255, alpha: 1)
        case .Yellow:
            return UIColor(red: 207/255, green: 194/255, blue: 53/255, alpha: 1)
        case .White:
            return UIColor.white
        case .Blue:
            return UIColor(red: 65/255, green: 114/255, blue: 157/255, alpha: 1)
        case .Orange:
            return UIColor(red: 174/255, green: 84/255, blue: 34/255, alpha: 1)
        case .Green:
            return UIColor(red: 91/255, green: 125/255, blue: 39/255, alpha: 1)
            
        default:
            return UIColor()
        }
    }
}

class TapeColorValues {
    let numberOfScaleLines = 14
    var TapeCodesInfos = [String : [String]]()
    var colorSelected: ColorScale?
    var lineValues: Array<String>
    var equipmentNames = Array<String>()
    
    init(colorSelected: ColorScale) {
        self.equipmentNames = Array(repeating: "", count: numberOfScaleLines)
        self.lineValues = Array(repeating: "", count: numberOfScaleLines)
        
        setEquipmentNames()
        TapeCodesInfos[ColorScale.Equipment.rawValue] = self.equipmentNames
        
        self.colorSelected = colorSelected
        setArrayTapeColorValues()
    }

    
    func setEquipmentNames(){
        //14 lines aligned with linePositions
        self.equipmentNames = [
            DataLoaderStrings.equipment.localized, DataLoaderStrings.resuscitationBag.localized,
            DataLoaderStrings.oxygenMask.localized,DataLoaderStrings.oralAirway.localized,
            DataLoaderStrings.laryngoscopeblade.localized, DataLoaderStrings.ETtube.localized,
            DataLoaderStrings.ETtubeInserctionLength.localized, DataLoaderStrings.suctionCatheter.localized,
            DataLoaderStrings.BPcuff.localized, DataLoaderStrings.IVcatheter.localized,
            DataLoaderStrings.IO.localized, DataLoaderStrings.NGtube.localized,
            DataLoaderStrings.urinaryCatheter.localized, DataLoaderStrings.chestTube.localized]
    }
    
    func setArrayTapeColorValues(){
        var colorInfoDB = ColorLineInfoDatabase.init()
        colorInfoDB.getScale(colorSelected: colorSelected!)
        setArrayPositions(colorInfoDB)
    }
    
    func setArrayPositions(_ colorLineDB: ColorLineInfoDatabase) {
        //14 lines
        self.lineValues = [colorLineDB.header,colorLineDB.resuscitationBag,colorLineDB.oxygenMask, colorLineDB.oralAirway,colorLineDB.laryngoscopeblade,colorLineDB.ETtube,colorLineDB.ETtubeInserctionLength,colorLineDB.suctionCatheter, colorLineDB.BPcuff,colorLineDB.IVcatheter,colorLineDB.IO,colorLineDB.NGtube,colorLineDB.urinaryCatheter,colorLineDB.chestTube ]
        
        //Key:value Eq. ["3-5Kg"] = [[info array about the weight]]
        TapeCodesInfos[(colorSelected?.rawValue)!] = self.lineValues
    }
}

struct ColorLineInfoDatabase {
    
    var header, resuscitationBag, oxygenMask, oralAirway, laryngoscopeblade, ETtube, ETtubeInserctionLength, suctionCatheter, BPcuff, IVcatheter, IO, NGtube, urinaryCatheter, chestTube : String
    
    init() {
        header = ""
        resuscitationBag = ""
        oxygenMask = ""
        oralAirway = ""
        laryngoscopeblade = ""
        ETtube = ""
        ETtubeInserctionLength = ""
        suctionCatheter = ""
        BPcuff = ""
        IVcatheter = ""
        IO = ""
        NGtube = ""
        urinaryCatheter = ""
        chestTube = ""
    }
    
    mutating func getScale(colorSelected: ColorScale) {
        switch colorSelected {
        
        case ColorScale.Blue:
            header = ""
            resuscitationBag = DataLoaderStrings.smallChild.localized
            oxygenMask = DataLoaderStrings.pediatric.localized
            oralAirway = "50"
            laryngoscopeblade = "1 \(DataLoaderStrings.straight.localized)"
            ETtube = "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)"
            ETtubeInserctionLength = "10,5-11"
            suctionCatheter = "8"
            BPcuff = DataLoaderStrings.smallChild.localized
            IVcatheter = "22-24"
            IO = "18/15"
            NGtube = "5-8"
            urinaryCatheter = "8"
            chestTube = "10-12"
            
        case ColorScale.Gray:
            header = ""
            resuscitationBag = DataLoaderStrings.smallChild.localized
            oxygenMask = DataLoaderStrings.pediatric.localized
            oralAirway = "50"
            laryngoscopeblade = "1 \(DataLoaderStrings.straight.localized)"
            ETtube = "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)"
            ETtubeInserctionLength = "10,5-11"
            suctionCatheter = "8"
            BPcuff = DataLoaderStrings.smallChild.localized
            IVcatheter = "22-24"
            IO = "18/15"
            NGtube = "5-8"
            urinaryCatheter = "8"
            chestTube = "10-12"
            
        case ColorScale.Green:
            header = ""
            resuscitationBag = DataLoaderStrings.smallChild.localized
            oxygenMask = DataLoaderStrings.pediatric.localized
            oralAirway = "50"
            laryngoscopeblade = "1 \(DataLoaderStrings.straight.localized)"
            ETtube = "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)"
            ETtubeInserctionLength = "10,5-11"
            suctionCatheter = "8"
            BPcuff = DataLoaderStrings.smallChild.localized
            IVcatheter = "22-24"
            IO = "18/15"
            NGtube = "5-8"
            urinaryCatheter = "8"
            chestTube = "10-12"
            
        case ColorScale.Orange:
            header = ""
            resuscitationBag = DataLoaderStrings.smallChild.localized
            oxygenMask = DataLoaderStrings.pediatric.localized
            oralAirway = "50"
            laryngoscopeblade = "1 \(DataLoaderStrings.straight.localized)"
            ETtube = "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)"
            ETtubeInserctionLength = "10,5-11"
            suctionCatheter = "8"
            BPcuff = DataLoaderStrings.smallChild.localized
            IVcatheter = "22-24"
            IO = "18/15"
            NGtube = "5-8"
            urinaryCatheter = "8"
            chestTube = "10-12"
            
        case ColorScale.Pink, ColorScale.Red:
            header = ""
            resuscitationBag = DataLoaderStrings.smallChild.localized
            oxygenMask = DataLoaderStrings.pediatric.localized
            oralAirway = "50"
            laryngoscopeblade = "1 \(DataLoaderStrings.straight.localized)"
            ETtube = "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)"
            ETtubeInserctionLength = "10,5-11"
            suctionCatheter = "8"
            BPcuff = DataLoaderStrings.smallChild.localized
            IVcatheter = "22-24"
            IO = "18/15"
            NGtube = "5-8"
            urinaryCatheter = "8"
            chestTube = "10-12"
            
        case ColorScale.Purple:
            header = ""
            resuscitationBag = DataLoaderStrings.smallChild.localized
            oxygenMask = DataLoaderStrings.pediatric.localized
            oralAirway = "50"
            laryngoscopeblade = "1 \(DataLoaderStrings.straight.localized)"
            ETtube = "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)"
            ETtubeInserctionLength = "10,5-11"
            suctionCatheter = "8"
            BPcuff = DataLoaderStrings.smallChild.localized
            IVcatheter = "22-24"
            IO = "18/15"
            NGtube = "5-8"
            urinaryCatheter = "8"
            chestTube = "10-12"
            
        case ColorScale.White:
            header = ""
            resuscitationBag = DataLoaderStrings.smallChild.localized
            oxygenMask = DataLoaderStrings.pediatric.localized
            oralAirway = "50"
            laryngoscopeblade = "1 \(DataLoaderStrings.straight.localized)"
            ETtube = "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)"
            ETtubeInserctionLength = "10,5-11"
            suctionCatheter = "8"
            BPcuff = DataLoaderStrings.smallChild.localized
            IVcatheter = "22-24"
            IO = "18/15"
            NGtube = "5-8"
            urinaryCatheter = "8"
            chestTube = "10-12"
            
        case ColorScale.Yellow:
            header = ""
            resuscitationBag = DataLoaderStrings.smallChild.localized
            oxygenMask = DataLoaderStrings.pediatric.localized
            oralAirway = "50"
            laryngoscopeblade = "1 \(DataLoaderStrings.straight.localized)"
            ETtube = "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)"
            ETtubeInserctionLength = "10,5-11"
            suctionCatheter = "8"
            BPcuff = DataLoaderStrings.smallChild.localized
            IVcatheter = "22-24"
            IO = "18/15"
            NGtube = "5-8"
            urinaryCatheter = "8"
            chestTube = "10-12"
            
        default:
            header = DataLoaderStrings.equipment.localized
        }
    }
    
}


