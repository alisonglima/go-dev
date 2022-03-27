import UIKit

class LoginViewController: UIViewController {
    private var safeArea: UILayoutGuide!
    private var users = [User]()
    
    lazy var swiftImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "AppIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var usernameTextField: UITextField = {
        let user = UITextField()
        user.placeholder = "Username or email"
        user.textColor = .black
        user.font = .systemFont(ofSize: 14)
        user.textContentType = .emailAddress
        user.backgroundColor = .systemGray6
        user.layer.borderWidth = 1
        user.translatesAutoresizingMaskIntoConstraints = false
        return user
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.font = .systemFont(ofSize: 14)
        password.placeholder = "Password"
        password.textContentType = .password
        password.isSecureTextEntry = true
        password.backgroundColor = .systemGray6
        password.layer.borderWidth = 1
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    lazy var forgotPasswordLabel: UILabel = {
        let forgot = UILabel()
        forgot.text = "forgot Password?"
        forgot.textColor = .orange
        forgot.font = .systemFont(ofSize: 14)
        forgot.translatesAutoresizingMaskIntoConstraints = false
        return forgot
    }()
    
    lazy var loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Entrar", for: .normal)
        login.backgroundColor = .orange
        login.setTitleColor(.white, for: .normal)
        login.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()
    
    private func clearInputs() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func createUsers() -> [User] {
        users.append(User("John Doe", "johndoe", "johndoe@email.com", "123456"))
        users.append(User("Jane Doe", "janedoe", "janedoe@email.com", "123456"))
        
        return users
    }
    
    private func login(_ username: String, _ password: String) -> Bool {
        for user in users {
            if (user.username == username || user.email == username) && user.password == password {
                return true
            }
        }
        
        return false
    }
    
    @IBAction func handleLogin() {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        view.backgroundColor = .white
        
        users = createUsers()
        
        view.addSubview(loginButton)
        
        view.addSubview(swiftImageView)
        NSLayoutConstraint.activate([
            swiftImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 72),
            swiftImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftImageView.heightAnchor.constraint(equalToConstant: 120),
            swiftImageView.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        view.addSubview(usernameTextField)
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: swiftImageView.bottomAnchor, constant: 44),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            usernameTextField.heightAnchor.constraint(equalToConstant: 45),
        ])
        
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        view.addSubview(forgotPasswordLabel)
        NSLayoutConstraint.activate([
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            forgotPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 60),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}

