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
import GoogleSignIn

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let helper = Helper()
    
    let greenHeartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "greenheart")
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        return imageView
    }()
    
    lazy var appName: UITextView = {
       let textView = UITextView()
        textView.text = helper.appNameText
        textView.textColor = UIColor.darkGray
        textView.font = helper.getAppFont(fontSize: 50)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainerInset = .zero;
        textView.textContainer.lineFragmentPadding = 0;
        return textView
    }()
    
    lazy var appSubname: UITextView = {
        let textView = UITextView()
        textView.text = helper.appSubnameText
        textView.font = helper.getAppFont(fontSize: 30)
        textView.textColor = UIColor.darkGray
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    lazy var noSignInButton: UIButton = {
        let button = UIButton()
        button.setTitle(helper.noUserText, for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel!.textAlignment = .center
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.backgroundColor = .clear
        
        return button
    }()

    lazy var termsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(helper.getGreenColor(), for: .normal)
        button.setTitle(helper.termsText, for: .normal)
        button.titleLabel!.textAlignment = .center
        button.titleLabel?.font = helper.getAppFont(fontSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLayout()
    }

    func prepareLayout(){
        //view.backgroundColor = .red
        
        view.addSubview(greenHeartImage)
        view.addSubview(appName)
        view.addSubview(appSubname)
        
        //Adjusting positions
        greenHeartImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 35, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        
        appName.anchor(top: greenHeartImage.layoutMarginsGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        
        appSubname.anchor(top: appName.layoutMarginsGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 10, right: 0), size: .zero)
        
        //FB Login
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email","public_profile"]
        
        //Remove fb button constraints to be able to manipulate the height
        fbLoginButton.removeConstraints(fbLoginButton.constraints)
        view.addSubview(fbLoginButton)
        
        fbLoginButton.anchor(top: appSubname.layoutMarginsGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 5, bottom: 0, right: -5), size: .init(width: 0, height: 50))
        
        //Google Login
        let googleButton = GIDSignInButton()
        view.addSubview(googleButton)
        
        googleButton.anchor(top: fbLoginButton.layoutMarginsGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 15, left: 3, bottom: 0, right: -3), size: .init(width: 0, height: 50))
        
        //Without sigin button
        view.addSubview(noSignInButton)
        
        noSignInButton.anchor(top: googleButton.layoutMarginsGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 15, left: 5, bottom: 0, right: -5), size: .init(width: 0, height: 50))
        
        view.addSubview(termsButton)
       
        termsButton.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 15, left: 5, bottom: 0, right: -5), size: .init(width: 0, height: 0))
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logout from facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil{
            print(error)
            return
        }
        
        print("success...")
        
        authWithFirebase()
    }
    
    func authWithFirebase(){
        let accessToken = FBSDKAccessToken.current()
        
        guard let accessTokenString = accessToken?.tokenString else
        { return }
        
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        
        //Firebase login with fb user
        Auth.auth().signIn(with: credentials) { (user, error) in
            if error != nil{
                print("Error:", error ?? "")
                return
            }
            
            print("User ok:", user ?? "")
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "id, name,email"]).start { (connection, result, error) in
            
            if error != nil{
                print("Error:", error ?? "")
            }
            print(result ?? "")
        }
   
    }
    
    
}


