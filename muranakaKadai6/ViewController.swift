//
//  ViewController.swift
//  muranakaKadai6
//
//  Created by 村中令 on 2021/10/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var numLabel: UILabel!
    @IBOutlet private weak var labelNumSlider: UISlider!
    fileprivate var randomNum = Int.random(in: 1...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = String(randomNum)
    }

    @IBAction private func judgeButton(_ sender: Any) {
        let sliderNum: Int = Int(labelNumSlider.value)

        if randomNum == sliderNum {
            presentAlert(message: "あたり! \n あなたの値: \(sliderNum)")
        } else {
            presentAlert(message: "はずれ! \n あなたの値: \(sliderNum)")
        }
    }

    func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let challengeAlert = UIAlertAction(title: "再挑戦", style: .default) { [weak self] _ in
            guard let self = self else {return print("アンラップに失敗")}
            self.randomNum = Int.random(in: 1...100)
            self.numLabel.text = String(self.randomNum)
        }
        alert.addAction(challengeAlert)
        present(alert, animated: true, completion: nil)
    }
}
