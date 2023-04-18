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
        calculationLabel1.text = "-11"
        calculationLabel2.text = "-22"
        
//        //  【Swift】キーボードと一緒にViewも上げる方法
//        //  https://orangelog.site/swift/slide-view-with-keyboard/
//        self.textField1.delegate = self
//        self.textField2.delegate = self
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        self.view.addGestureRecognizer(tapGesture)

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

        let value1 = Int(textField1.text ?? "") ?? 0
        let value2 = Int(textField2.text ?? "") ?? 0

        let reversedValue1 = switch1.isOn ? -value1 : value1
        let reversedValue2 = switch2.isOn ? -value2 : value2

        // 数値を表示ラベルに設定
        calculationLabel1.text = String(reversedValue1)
        calculationLabel2.text = String(reversedValue2)
        
        // 計算結果表示用のラベルに表示
        //totalData = hensuData_1 + hensuData_2
        calculationResultLabel.text = "計算結果：" + String(reversedValue1 + reversedValue2)
    }
}
