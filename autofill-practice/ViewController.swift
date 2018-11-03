//
//  ViewController.swift
//  autofill-practice
//
//  Created by Jinsei Shima on 2018/11/02.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

import AuthenticationServices

class CredentialProvider: ASCredentialProviderViewController {
    
}


class ViewController: UIViewController {

    let emailTextField = UITextField()
    let pinCodeTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Proactive Suggestions
        // emailなどtextContentTypeに指定したコンテンツを入力補完として表示
        // UITextInputTraitsに準拠しているUITextViewとUITextFieldで使用できる
        // 他のアプリで最近入力したデータが候補として表示される
        
        emailTextField.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 40)
        emailTextField.center = CGPoint(x: view.center.x, y: view.center.y - 100)
        emailTextField.textContentType = .emailAddress
        emailTextField.keyboardType = .emailAddress
        emailTextField.backgroundColor = .groupTableViewBackground
        view.addSubview(emailTextField)
        
        pinCodeTextField.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 40)
        pinCodeTextField.center = view.center
        if #available(iOS 12.0, *) {
            pinCodeTextField.textContentType = .oneTimeCode
        }
        pinCodeTextField.keyboardType = .numbersAndPunctuation
        pinCodeTextField.backgroundColor = .groupTableViewBackground
        view.addSubview(pinCodeTextField)

        
        
    }

}

