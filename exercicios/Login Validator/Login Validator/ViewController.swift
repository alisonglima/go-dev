//
//  ViewController.swift
//  Login Validator
//
//  Created by FL00022 on 13/03/22.
//

import UIKit

class User {
    let name: String
    let username: String
    let email: String
    let password: String
    
    init(_ name: String, _ username: String, _ email: String, _ password: String) {
        self.name = name
        self.username = username
        self.email = email
        self.password = password
    }
}


class ViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func createUsers() -> [User] {
        var users = [User]()
        
        users.append(User("John Doe", "johndoe", "johndoe@email.com", "123456"))
        users.append(User("Jane Doe", "janedoe", "janedoe@email.com", "123456"))
        
        return users
    }
    
    func login(_ username: String, _ password: String) -> Bool {
        let users = createUsers()
        
        for user in users {
            if (user.username == username || user.email == username) && user.password == password {
                return true
            }
        }
        
        return false
    }
    
    func clearInputs() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func handleLogin(_ sender: UIButton) {
        let username = String(usernameTextField.text!)
        let password = String(passwordTextField.text!)
        
        var alert: UIAlertController
        
        if username == "" || password == "" {
            alert = UIAlertController(title: "Atenção", message: "Você deve preencher os campos de email e senha!", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            }))
            
            present(alert, animated: true, completion: nil)
            
            clearInputs()
            
            return
        }
        
        if login(username, password) {
            alert = UIAlertController(title: "Login", message: "Login feito com sucesso!", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            }))
        } else {
            alert = UIAlertController(title: "Login", message: "Usuário e/ou senha incorretos!", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            }))
        }
        
        clearInputs()
        
        present(alert, animated: true, completion: nil)
    }
}

