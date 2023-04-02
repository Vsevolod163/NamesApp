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
        
        compatibilityVC.firstName = firstNameTF.text
        compatibilityVC.secondName = secondNameTF.text
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
        firstNameTF.text = ""
        secondNameTF.text = ""
    }
}

