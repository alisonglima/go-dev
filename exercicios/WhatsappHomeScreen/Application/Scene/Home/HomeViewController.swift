import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    //var safeArea: UILayoutGuide!
    
    lazy var tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var friends = FriendList() {
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let addButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callSecoundView))
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    @objc private func callSecoundView() {
        let thirdViewController = ThirdViewController()
        
        navigationController?.present(thirdViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFriends()
        
        title = "Chats"
        
        view.backgroundColor = .white
        
        view.addSubview(tableview)
        
        tableview.delegate = self
        tableview.dataSource = self
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableview.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        
    }
    
    private func getFriends() {
        Service.shared.getProfile { result in
            switch result {
            case .success(let res):
                self.friends = res
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secoundViewController = SecoundViewController()
        
        if let _ = navigationController {
            navigationController?.pushViewController(secoundViewController, animated: true)
        } else {
            present(secoundViewController, animated: true)
        }
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        
        let friend = friends[indexPath.row]
        
        cell.getCellData(with: friend)
        
        return cell
    }
    
    
}

