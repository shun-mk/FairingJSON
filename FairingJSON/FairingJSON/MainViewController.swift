//
//  ViewController.swift
//  FairingJSON
//
//  Created by Shunsaku Miki on 2017/02/19.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController, NSTextViewDelegate {
    
    
    // MARK: - IBAction
    
    @IBAction func fairingBtnTapped(_ sender: Any) {
        let inputData = self.inputString?.data(using: .utf8)
        let jsonObject = JsonManager.genJsonObject(inputData) as? [String: Any]
        
        if let jsonObject = jsonObject {
            self.editTextView.string = jsonObject.debugDescription
        } else {
            let alert = NSAlert()
            alert.messageText = "Json形式になっていません。"
            alert.runModal()
        }
    }
    
    
    // MARK: - Delegate
    
    /**
     textFieldの変更を検知
     
     - parameter notification: Notification
     */
    func textDidChange(_ notification: Notification) {
        let textView = notification.object as! NSTextView
        self.inputString = textView.string
        print(self.inputString ?? "nil")
    }

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editTextView.delegate = self
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    // MARK: - property

    /** 編集用テキストビュー */
    @IBOutlet var editTextView: NSTextView!
    /** 入力された文字列 */
    fileprivate var inputString: String?

}

