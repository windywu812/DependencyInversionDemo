//
//  ViewController.swift
//  DependencyInversionDemo
//
//  Created by Windy on 13/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Dependency
    private var dataProvider: DataProviderProtocol!
    
    // Initializer Injection
    convenience init(dataProvider: DataProviderProtocol) {
        self.init(nibName: nil, bundle: nil)
        
        self.dataProvider = dataProvider
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        navigationItem.title = "DIP Demo"
        
        dataProvider.getAllData { [weak self] result in
            switch result {
            case .success(let dataSource):
                self?.dataSource = dataSource
            case .failure(let err):
                print(err)
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return dataSource.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
}
