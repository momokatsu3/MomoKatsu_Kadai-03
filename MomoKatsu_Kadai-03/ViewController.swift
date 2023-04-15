//
//  ViewController.swift
//  MomoKatsu_Kadai-03
//
//  Created by モモカツ on 2023/04/13.
//

import UIKit

class ViewController: UIViewController {
    
    // テキストフィールドを設定
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    // 計算結果表示用などのラベルを設定
    @IBOutlet weak var calculationResultLabel: UILabel!
    @IBOutlet weak var calculationLabel1: UILabel!
    @IBOutlet weak var calculationLabel2: UILabel!
    
    // Switch部品の設定
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // テキストフィールドとラベルを初期化
        textField1.text = "11"
        textField2.text = "22"
        calculationLabel1.text = "11"
        calculationLabel2.text = "22"
        
//        //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//        //  【Swift】キーボードと一緒にViewも上げる方法
//        //  https://orangelog.site/swift/slide-view-with-keyboard/
//        self.textField1.delegate = self
//        self.textField2.delegate = self
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        self.view.addGestureRecognizer(tapGesture)
//        //↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
//
        // 各textFieldでクリックした際にキーボードタイプを数字のみに変更する
        // numberPad や decimalPad を使用すると、Can't find keyplane that supports type 4 for keyboardが
        // 表示されるので、以下の numbersAndPunctuation に変更した。
        textField1.keyboardType = UIKeyboardType.numberPad//numbersAndPunctuation
        textField2.keyboardType = UIKeyboardType.numberPad//numbersAndPunctuation

    }
    
    // 【Swift】UISwitchの使い方。ONとOFFを切り替えるボタンを設置する。
    //　https://hajihaji-lemon.com/swift/post-6168/
    // 計算開始ボタンのクリックにより、スイッチで設定した＋・ー符号により掲載後、ラベルに計算結果を表示する。
    @IBAction func calculationStart(_ sender: Any) {
        
        // 本関数で使用する変数の設定と初期化
        //var totalData: Int = 0
        var hensuData_1: Int = 0
        var hensuData_2: Int = 0
        
//        // switchの状態を確認
//        print ( "Switch１：", switch1.isOn )
//        print ( "Switch２：", switch1.isOn )
        
        // テキストフィールドに入力文字がある場合は、switchの状態を反映して数値変換する。
        if textField1.text! != "" {
            hensuData_1 = Int( textField1.text! )!
            if switch1.isOn == true {
                hensuData_1 = hensuData_1 * -1
            }
        }
        if textField2.text! != "" {
            hensuData_2 = Int( textField2.text! )!
            if switch2.isOn == true {
                hensuData_2 = hensuData_2 * -1
            }
        }
        
        // 数値を表示ラベルに設定
        calculationLabel1.text = String( hensuData_1 )
        calculationLabel2.text = String( hensuData_2 )
        
        // 計算結果表示用のラベルに表示
        //totalData = hensuData_1 + hensuData_2
        calculationResultLabel.text = "計算結果：" + String( hensuData_1 + hensuData_2 )
        
    }
    
    
//    //↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//        //  【Swift】キーボードと一緒にViewも上げる方法
//        //  https://orangelog.site/swift/slide-view-with-keyboard/
//        @objc func keyboardWillShow(notification: NSNotification) {
//            // 今回は、Viewを上げないように以下をコメントアウトした。
//    //        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//    //            if self.view.frame.origin.y == 0 {
//    //                self.view.frame.origin.y -= keyboardSize.height
//    //            } else {
//    //                let suggestionHeight = self.view.frame.origin.y + keyboardSize.height
//    //                self.view.frame.origin.y -= suggestionHeight
//    //            }
//    //        }
//        }
//
//        @objc func keyboardWillHide() {
//            if self.view.frame.origin.y != 0 {
//                self.view.frame.origin.y = 0
//            }
//        }
//
//        @objc func dismissKeyboard() {
//            self.view.endEditing(true)
//        }
//
//        override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(animated)
//            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        }
//
//}
//
//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }
}
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

