//
//  ViewController.swift
//  NamesApp
//
//  Created by Vsevolod Lashin on 02.04.2023.
//

import UIKit

final class NamesViewController: UIViewController {

    @IBOutlet var resultButton: UIButton!

    @IBOutlet var firstNameTF: UITextField!
    @IBOutlet var secondNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let compatibilityVC = segue.destination as? CompatibilityViewController else { return }
        
        if firstNameTF.text?.isEmpty ?? false || secondNameTF.text?.isEmpty ?? false {
            showAlert(title: "Empty name", message: "Enter your names 😊")
            return
        }
        
        compatibilityVC.firstName = firstNameTF.text
        compatibilityVC.secondName = secondNameTF.text
    }
    
    @IBAction func resultButtonTapped() {
        performSegue(withIdentifier: "goToCompatibility", sender: nil)
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        firstNameTF.text = ""
        secondNameTF.text = ""
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.firstNameTF.text = ""
            self.secondNameTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension NamesViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTF {
            secondNameTF.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
        
        return true
    }
}

