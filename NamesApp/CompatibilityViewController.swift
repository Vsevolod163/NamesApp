//
//  CompatibilityViewController.swift
//  NamesApp
//
//  Created by Vsevolod Lashin on 02.04.2023.
//

import UIKit

final class CompatibilityViewController: UIViewController {

    @IBOutlet var namesLabel: UILabel!
    @IBOutlet var percentLabel: UILabel!
    
    @IBOutlet var backButton: UIButton!
    
    var firstName: String!
    var secondName: String!
    
    @IBOutlet var compatibilityPV: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 10
        
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
    }
}
