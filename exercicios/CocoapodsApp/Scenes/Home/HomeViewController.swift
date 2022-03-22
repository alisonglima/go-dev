//
//  ViewController.swift
//  CocoapodsApp
//
//  Created by FL00022 on 21/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    lazy var people = PeopleList() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
        title = "Home"
        
        delegates()
        getPeople()
        register()
    }
        
    private func delegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
        
    private func register() {
        let nib = UINib(nibName: PeopleTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PeopleTableViewCell.identifier)
    }
    
    private func getPeople() {
        ApiService.shared.getPeople { result in
            switch result {
            case .success(let res):
                self.people = res
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(people)
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PeopleTableViewCell.identifier, for: indexPath) as? PeopleTableViewCell {
            let person = people[indexPath.row]
            
            cell.updateCellView(person)
            
            return cell
        } else {
            return PeopleTableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
