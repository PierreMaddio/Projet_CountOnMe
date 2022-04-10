//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Properties
    var calculator = Calculator()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculator.tappedNumber(numberText: numberText)
        attributeText()
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        guard calculator.canAddOperator else {
            alert(message: "Un operateur est déja mis !")
            return
        }
        calculator.multiplication()
        attributeText()
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        guard calculator.canAddOperator else {
            alert(message: "Un operateur est déja mis !")
            return
        }
        calculator.division()
        attributeText()
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        guard calculator.canAddOperator else {
            alert(message: "Un operateur est déja mis !")
            return
        }
        calculator.addition()
        attributeText()
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        guard calculator.canAddOperator else {
            alert(message: "Un operateur est déja mis !")
            return
        }
        calculator.substraction()
        attributeText()
    }
    
    @IBAction func tappedCommaButton(_ sender: Any) {
        guard calculator.canAddComma else {
            alert(message: "Entrez une expression correcte !")
            return
        }
        calculator.tappedNumber(numberText: ".")
        attributeText()
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionHaveEnoughElement else {
            alert(message: "Démarrez un nouveau calcul !")
            return
        }
        
        guard calculator.expressionIsCorrect else {
            alert(message: "Entrez une expression correcte !")
            return
        }
        
        // Call the result method
        calculator.result()
        
        // Check if division by zero is in the expression
        guard !calculator.expressionHasNoZeroDivision else {
            alert(message: "La division par zero est impossible !")
            attributeText()
            return
        }
        attributeText()
    }
    
    @IBAction func tappedResetButton(_ sender: UIButton) {
        textView.text.removeAll()
        calculator.calculationText.removeAll()
        textView.text = "0"
    }
    
    // MARK: - Methods
    // Method to attribute the text view
    func attributeText() {
        textView.text = calculator.calculationText
    }
    
    private func alert(message: String) {
        let alertVC: UIAlertController = UIAlertController(title: "Erreur!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}


