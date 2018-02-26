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
    var TapeCodesInfos = [String : [String]]()
    var colorSelected: ColorScale?

    init() {
        initTapeCodes()
    }
    
    func initTapeCodes()  {
        TapeCodesInfos["0"] = getEquipmentNames()
    }
    
    func getEquipmentNames() -> [String]{
        //14 lines
        let arrayEquipmentNames = [
            DataLoaderStrings.equipment.localized, DataLoaderStrings.resuscitationBag.localized,
            DataLoaderStrings.oxygenMask.localized,DataLoaderStrings.oralAirway.localized,
            DataLoaderStrings.laryngoscopeblade.localized, DataLoaderStrings.ETtube.localized,
            DataLoaderStrings.suctionCatheter.localized,
            DataLoaderStrings.BPcuff.localized, DataLoaderStrings.IVcatheter.localized,
            DataLoaderStrings.IO.localized, DataLoaderStrings.NGtube.localized,
            DataLoaderStrings.urinaryCatheter.localized, DataLoaderStrings.chestTube.localized]
        
        return arrayEquipmentNames
    }
    
    func getPinkRedValues() -> [String]{
        
        
        
        let arrayInfo = [DataLoaderStrings.smallChild.localized, DataLoaderStrings.pediatric.localized,
                         "50", "1 \(DataLoaderStrings.straight.localized)",
                         "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)",             "10,5-11","8",DataLoaderStrings.smallChild.localized,
                         "22-24", "18/15", "5-8", "8", "10-12"]
        
        return arrayInfo
    }
    
    func setArrayInformation() -> [TapeLinePosition]{
        
        
        
        let arrayInfo = [DataLoaderStrings.smallChild.localized, DataLoaderStrings.pediatric.localized,
                         "50", "1 \(DataLoaderStrings.straight.localized)",
            "3.5 \(DataLoaderStrings.uncuffed.localized) 3.0 \(DataLoaderStrings.cuffed.localized)",             "10,5-11","8",DataLoaderStrings.smallChild.localized,
            "22-24", "18/15", "5-8", "8", "10-12"]
        
        return pos
    }
}

struct TapeLinePosition{
    var linePositions: Array<String> = Array(repeating: "", count: 14)
}
