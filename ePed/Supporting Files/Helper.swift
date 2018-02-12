//
//  Helper.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 12/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit

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
