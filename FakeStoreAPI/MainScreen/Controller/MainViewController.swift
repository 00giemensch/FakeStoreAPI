//
//  MainViewController.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 09.08.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    private var tableData: [StoreItem] = []
    private var mainView: MainView!

    override func loadView() {
            mainView = MainView()
            view = mainView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Магазин"
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        let username = UserDefaults.standard.string(forKey: "username")
        mainView.updateGreetings(username: username)
        
        loadData()
    }
    
    private func loadData() {
        let service = NetworkService()
        service.sendRequest { [weak self] items in
            DispatchQueue.main.async {
                self?.tableData = items
                self?.mainView.tableView.reloadData()
            }
        }
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }
        cell.configuration(item: tableData[indexPath.row])
        cell.selectionStyle = .none 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
}

extension MainViewController: UITableViewDelegate {}
