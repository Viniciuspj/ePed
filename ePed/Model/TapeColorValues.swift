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
            return UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
        case .Pink:
            return UIColor(red: 242/255, green: 170/255, blue: 220/255, alpha: 1)
        case .Red:
            return UIColor(red: 200/255, green: 40/255, blue: 34/255, alpha: 0.9)
        case .Purple:
            return UIColor(red: 112/255, green: 48/255, blue: 157/255, alpha: 0.8)
        case .Yellow:
            return UIColor(red: 237/255, green: 237/255, blue: 53/255, alpha: 1)
        case .White:
            return UIColor.white
        case .Blue:
            return UIColor(red: 33/255, green: 203/255, blue: 238/255, alpha: 1)
        case .Orange:
            return UIColor(red: 254/255, green: 148/255, blue: 52/255, alpha: 1)
        case .Green:
            return UIColor(red: 146/255, green: 208/255, blue: 89/255, alpha: 1)
            
        default:
            return UIColor()
        }
    }
}

class TapeColorValues {
    let numberOfScaleLines = 14
    var colorSelected: ColorScale?
    var lineValues: Array<String>
    var equipmentNames = Array<String>()
    
    init(colorSelected: ColorScale) {
        self.equipmentNames = Array(repeating: "", count: numberOfScaleLines)
        self.lineValues = Array(repeating: "", count: numberOfScaleLines)
        
        setEquipmentNames()
        
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
            header = DataLoaderStrings.Blue.localized
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
            header = DataLoaderStrings.Gray.localized
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
            header = DataLoaderStrings.Green.localized
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
            header = DataLoaderStrings.Orange.localized
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
            
        case ColorScale.Pink:
            header = DataLoaderStrings.Pink.localized
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
            
        case ColorScale.Red:
            header = DataLoaderStrings.Red.localized
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
            header = DataLoaderStrings.Purple.localized
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
            header = DataLoaderStrings.White.localized
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
            header = DataLoaderStrings.Yellow.localized
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


