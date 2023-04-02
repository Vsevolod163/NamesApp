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
    
    @IBOutlet var compatibilityPV: UIProgressView!
    
    var firstName: String!
    var secondName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard firstName != nil, secondName != nil else { return }
        
        backButton.layer.cornerRadius = 10
        compatibilityPV.transform = compatibilityPV.transform.scaledBy(x: 1, y: 4)
        
        let resultValue = findResult()
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
        
        percentLabel.text = resultValue.formatted(.percent)
        compatibilityPV.progressTintColor = resultValue < 50 ? .red : .green
        compatibilityPV.progress = Float(resultValue) / 100
    }
    
    private func getValueOf(name: String) -> Int {
        var count = 0
        
        for character in name.lowercased() {
            switch character {
            case "a", "i", "j", "q", "y":
                count += 1
            case "b", "k", "r":
                count += 2
            case "c", "g", "l", "s":
                count += 3
            case "d", "m", "t":
                count += 4
            case "e", "h", "n", "x":
                count += 5
            case "u", "v", "w":
                count += 6
            case "o", "z":
                count += 7
            case "f", "p":
                count += 8
            default:
                count += 0
            }
        }
        
        return count
    }
    
    private func findResult() -> Int {
        var result = 0

        let firstValue = Double(getValueOf(name: firstName))
        let secondValue = Double(getValueOf(name: secondName))
      
        if firstValue < secondValue {
            result = Int(firstValue / secondValue * 100)
        } else {
            result = Int(secondValue / firstValue * 100)
        }
    
        return result
    }
}
