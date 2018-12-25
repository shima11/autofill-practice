//
//  ViewController.swift
//  autofill-practice
//
//  Created by Jinsei Shima on 2018/11/02.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit
import StackScrollView
import Then
import EasyPeasy


import AuthenticationServices

class CredentialProvider: ASCredentialProviderViewController {
    
}


class ViewController: UIViewController {

    let stackScrollView = StackScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(stackScrollView)
        stackScrollView.frame = view.bounds

        // Proactive Suggestions
        // emailなどtextContentTypeに指定したコンテンツを入力補完として表示
        // UITextInputTraitsに準拠しているUITextViewとUITextFieldで使用できる
        // 他のアプリで最近入力したデータが候補として表示される

        stackScrollView.append(views: [
            UILabel().then { $0.text = "email textview" },
            UITextView().then {
                $0.textContentType = .emailAddress
                $0.keyboardType = .emailAddress
                $0.easy.layout(Height(40))
            },
            UILabel().then { $0.text = "email textfield" },
            UITextField().then {
                $0.textContentType = .emailAddress
                $0.keyboardType = .emailAddress
                $0.easy.layout(Height(40))
            },
            UILabel().then { $0.text = "pincode textview" },
            UITextView().then {
                $0.textContentType = .oneTimeCode
                $0.keyboardType = .numberPad
                $0.easy.layout(Height(40))
            },
            UILabel().then { $0.text = "pincode textfield" },
            UITextField().then {
                $0.textContentType = .oneTimeCode
                $0.keyboardType = .numberPad
                $0.easy.layout(Height(40))
            },
            UILabel().then { $0.text = "password textview" },
            UITextView().then {
                $0.textContentType = .newPassword
                $0.keyboardType = .numbersAndPunctuation
                $0.easy.layout(Height(40))
            },
            UILabel().then { $0.text = "password textfield" },
            UITextField().then {
                $0.textContentType = .newPassword
                $0.keyboardType = .numbersAndPunctuation
                $0.easy.layout(Height(40))
            },
            UILabel().then { $0.text = "fullstreetAddress textview" },
            UITextView().then {
                $0.textContentType = UITextContentType.fullStreetAddress
                $0.easy.layout(Height(40))
            },
            UILabel().then { $0.text = "fullstreetAddress textfield" },
            UITextField().then {
                $0.textContentType = .fullStreetAddress
                $0.easy.layout(Height(40))
            },
            ])


        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(keyboardDidChangeFrame(notification:)),
                name: UIResponder.keyboardDidChangeFrameNotification,
                object: nil
        )

    }

    @objc func keyboardDidChangeFrame(notification: Notification) {

        let keyboardHeight: CGFloat = 200
        stackScrollView.contentInset = .init(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }

}

