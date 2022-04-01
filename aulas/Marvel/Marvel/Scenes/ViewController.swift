import UIKit

class ViewController: UIViewController {
    var viewModel: HeroViewModel?
    
    private enum ViewState  {
        case loading
        case normal
        case error
    }
    
    private var state: ViewState = .normal {
        didSet {
            self.setupView()
        }
    }
    
    func setupView() {
        switch state {
        case .loading:
            print("loading")
            // Carrega o loading
        case .normal:
            print("normal")
            // Remove o loading
            // Atualiza a tabela
        case .error:
            print("error")
            // Remove o loading
            // Notifica o usuário que algo deu errado
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        viewModel?.delegate = self
        
        state = .loading
        
        fetchHero()
    }
    
    private func fetchHero() {
        viewModel?.fetchHero()
    }
}

extension ViewController: HeroViewModelDelegate {
    func heroFetchWithSuccess() {
        print("Success")
        state = .normal
    }
    
    func errorToFetchHero(_ error: String) {
        print("Error")
        state = .error
    }
}


