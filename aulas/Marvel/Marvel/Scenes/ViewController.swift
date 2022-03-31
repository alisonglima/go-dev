import UIKit

class ViewController: UIViewController {
    
    let service = HeroListService()
    
    var items: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        service.execute { result in
            switch result {
            case .success(let hero):
                self.items = hero
            case .failure(let error):
                print(error)
            }
        }
    }
}



