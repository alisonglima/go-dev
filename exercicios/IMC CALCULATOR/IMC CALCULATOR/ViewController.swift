//
//  ViewController.swift
//  IMC CALCULATOR
//
//  Created by FL00022 on 12/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var WeightTextField: UITextField!
    @IBOutlet var HeightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }
    
    func calculateImc (_ weight: Float, _ height: Float) -> String {
        let imc: Float = weight/(height*height)
        let imcFormated: String = String(format: "%.2f", imc)
        
        switch imc {
        case _ where imc < 18.5:
            return "Seu IMC é \(imcFormated) - Você está abaixo do seu peso ideal"
        case _ where imc < 25:
            return "Seu IMC é \(imcFormated) - Você está no seu peso ideal"
        case _ where imc < 30:
            return "Seu IMC é \(imcFormated) - Você está com sobrepeso"
        case _ where imc < 35:
            return "Seu IMC é \(imcFormated) - Você está com obesidade GRAU 1"
        case _ where imc < 40:
            return "Seu IMC é \(imcFormated) - Você está com obesidade GRAU 2"
        case _ where imc >= 40:
            return "Seu IMC é \(imcFormated) - Você está com obesidade GRAU 3"
        default:
            return "Error"
        }
    }

    
    @IBAction func CalculateImcButton(_ sender: UIButton) {
        let weightToFloat: Float = Float(WeightTextField.text!) ?? 0
        let heighttoFloat: Float = Float(HeightTextField.text!) ?? 0
        
        let imc = calculateImc(weightToFloat, heighttoFloat)
        
        let alert = UIAlertController(title: "Confira seu IMC", message: imc, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
        }))
        
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

