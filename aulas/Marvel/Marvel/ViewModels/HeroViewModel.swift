import Foundation

class HeroViewModel {
    // MARK: - Delegates
    weak var delegate: HeroViewModelDelegate?
    
    // MARK: - Private Properties
    private var services: HeroListServiceProtocol
    
    // MARK: - Public Properties
    var hero: Hero?
    
    // MARK: - Constructor
    init(services: HeroListServiceProtocol) {
        self.services = services
    }
    
    // MARK: - Public Methods
    
    ///Method fetch hero results
    ///Paramters - x 
    func fetchHero() {
        services.execute { result in
            switch result {
            case .success(let hero):
                self.success(hero: hero)
            case .failure(let error):
                self.error(error: error.localizedDescription)
            }
        }
    }
    
    // MARK: - Private Methods
    private func success(hero: Hero) {
        self.hero = hero
        delegate?.heroFetchWithSuccess()
    }
    
    private func error(error: String) {
        delegate?.errorToFetchHero(error)
    }
}
