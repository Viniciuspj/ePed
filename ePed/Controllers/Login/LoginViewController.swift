//
//  ViewController.swift
//  ePed
//
//  Created by Vinícius  Gontijo on 10/02/2018.
//  Copyright © 2018 Vinícius Gontijo. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class LoginViewController: UIViewController {
    
    let appName: UITextView = {
       let textView = UITextView()
        textView.text = "ePed"
        textView.font = UIFont.boldSystemFont(ofSize: 50)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainerInset = .zero;
        textView.textContainer.lineFragmentPadding = 0;
        return textView
    }()
    
    let appSubname: UITextView = {
        let textView = UITextView()
        textView.text = NSLocalizedString("Emergência Pediátrica", comment: "Emergência Pediátrica")
        textView.font = UIFont.boldSystemFont(ofSize: 30)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLayout()
    }

    func prepareLayout(){
        //view.backgroundColor = .red

        view.addSubview(appName)
        view.addSubview(appSubname)
        
        appName.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        
        appSubname.anchor(top: appName.layoutMarginsGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 10, right: 0), size: .zero)
        
        //FB Login
        let fbLoginButton = FBSDKLoginButton()
        
        //Remove fb button constraints to be able to manipulate the height
        fbLoginButton.removeConstraints(fbLoginButton.constraints)
        //fbLoginButton.langua

        view.addSubview(fbLoginButton)
        
        fbLoginButton.anchor(top: appSubname.layoutMarginsGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 5, bottom: 0, right: -5), size: .init(width: 0, height: 50))
    }
}

extension UIView{
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        
        if size.width != 0{
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0{
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchorSize(to view: UIView){
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}

