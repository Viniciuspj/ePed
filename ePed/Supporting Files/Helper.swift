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

struct Helper{
    
    //App texts and strings
    let appNameText = "ePed"
    let appSubnameText = NSLocalizedString("Emergência Pediátrica", comment: "Emergência Pediátrica")
    let noUserText = NSLocalizedString("Entre sem registro", comment: "Entre sem logar")
    let termsText = NSLocalizedString("Termos de uso", comment: "Termos de uso")
    
    func getAppFont(fontSize size: Int) -> UIFont{
        return UIFont.init(name: "Avenir-book", size: CGFloat(size))!
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



