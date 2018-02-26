//
//  Helper.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 12/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

enum AppColors{
    case green
    case red
    
    func getColor() -> UIColor{
        switch self {
        case .green:
            return UIColor.init(red: 29/255, green: 216/255, blue: 138/255, alpha: 1)
        case .red:
            return UIColor.init(red: 29/255, green: 216/255, blue: 138/255, alpha: 1)
        }
    }
}

enum DataLoaderStrings: String {
    
    //App texts and strings
    case appName = "ePed"
    case appSubnameText = "Emergência Pediátrica"
    case noUserText = "Entre sem registro"
    case termsText = "Termos de uso"
    
    //Tape codes values strings
    case equipment = "Equipamento"
    case resuscitationBag = "Bolsa de ventilação/insuflador"
    case oxygenMask = "Máscara de oxigênio (NRB)"
    case oralAirway = "Cânula orofaríngea (mm)"
    case laryngoscopeblade = "Lâmina laringoscópica (tamanho)"
    case ETtube = "Tubo ET (mm)"
    case ETtubeInserctionLength = "Comprimento de inserção do tubo ET (cm)"
    case suctionCatheter = "Cateter de aspiração (F)"
    case BPcuff = "Esfigmomanômetro"
    case IVcatheter = "Cateter IV (ga)"
    case IO = "IO (ga)"
    case NGtube = "Tubo NG (F)"
    case urinaryCatheter = "Cateter urinário (F)"
    case chestTube = "Tubo torácico (F)"
    
    //Tapes columns
    case smallInfant = "Bebê pequeno 6-7kg"
    case smallChild = "Bebê/criança"
    case child = "Criança"
    case pediatric = "Pediátrica"
    case straight = "reta"
    case straightCurved = "reta ou curva"
    case uncuffed = "sem cuff"
    case cuffed = "com cuff"
    
    var localized: String {
        return self.rawValue.localized()
    }
}

struct Helper{
    func getAppFont(fontSize size: Int) -> UIFont{
        return UIFont.init(name: "Avenir-book", size: CGFloat(size))!
    }
    
    ///Utilize para facilitar a instancia de ViewControllers do Storyboard
    func storyBoardWithName(name:String, storyboardId:String? = nil) -> UIViewController{
        if let storyboardId = storyboardId{
            return UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: storyboardId)
        }else{
            return UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        }
    }
    
    ///Utilize para mostrar um alertviewcontroller com opção
    func showAlert(viewController: UIViewController, title: String, message: String, block: (() -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "OK", style: .default, handler: { (_) -> Void in
            block?()
        })
        alertController.addAction(retryAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}


@IBDesignable class UITextViewFixed: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    func setup() {
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
    }
}



