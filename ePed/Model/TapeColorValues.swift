//
//  TapeCodes.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 24/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import Foundation

enum ColorScale {
    case Gray
    case Pink
    case Red
    case Purple
    case Yellow
    case White
    case Blue
    case Orange
    case Green
}

class TapeColorValues {
    let numberOfScaleLines = 14
    
    var TapeCodesInfos = [String : [String]]()
    var colorSelected: ColorScale?
    var linePositions: Array<String>
    
    var equipmentNames: Array<String> {
        get{
            return self.equipmentNames
        }
        set{
            setEquipmentNames()
        }
    }

    init() {
        self.linePositions = Array(repeating: "", count: numberOfScaleLines)
        
        TapeCodesInfos["0"] = self.equipmentNames
    }

    
    func setEquipmentNames(){
        //14 lines
        self.equipmentNames = Array(repeating: "", count: numberOfScaleLines)
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
        self.linePositions[0] = colorLineDB.header
        self.linePositions[1] = colorLineDB.resuscitationBag
        self.linePositions[2] = colorLineDB.oxygenMask
        self.linePositions[3] = colorLineDB.oralAirway
        self.linePositions[4] = colorLineDB.laryngoscopeblade
        self.linePositions[5] = colorLineDB.ETtube
        self.linePositions[6] = colorLineDB.ETtubeInserctionLength
        self.linePositions[7] = colorLineDB.suctionCatheter
        self.linePositions[8] = colorLineDB.BPcuff
        self.linePositions[9] = colorLineDB.IVcatheter
        self.linePositions[10] = colorLineDB.IO
        self.linePositions[11] = colorLineDB.NGtube
        self.linePositions[12] = colorLineDB.urinaryCatheter
        self.linePositions[13] = colorLineDB.chestTube
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

        }
    }
    
}


