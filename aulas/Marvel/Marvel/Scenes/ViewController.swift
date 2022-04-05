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
            print(viewModel?.hero?.data.results[0])
        case .error:
            print("error")
            // Remove o loading
            // Notifica o usuário que algo deu errado
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        delegates()
        initialState()
        
        viewModel?.delegate = self
        fetchHero()
    }
    
    private func delegates() {
        viewModel?.delegate = self
    }
    
    private func initialState()  {
        state = .loading
    }
    
    private func configureUI() {
        view.backgroundColor = .red
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


