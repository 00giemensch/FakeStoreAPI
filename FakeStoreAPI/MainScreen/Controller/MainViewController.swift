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


//class MainViewController: UIViewController {
//    
////    var tableData = Item.mockData()
//    private var tableData: [StoreItem] = []
//    
//    private var username: String?
//    
//    private lazy var tableView: UITableView = {
//        $0.dataSource = self
//        $0.delegate = self
//        $0.register(ItemCell.self, forCellReuseIdentifier: "Cell")
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.rowHeight = 100
//        return $0
//    }(UITableView())
//    
//    lazy var greetingsLbl: UILabel = {
//        $0.text = "Привет, \(username!)!"
//        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//        $0.setContentHuggingPriority(.required, for: .horizontal)
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        return $0
//    }(UILabel())
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGray6
//        title = "Магазин"
//        username = UserDefaults.standard.string(forKey: "username")
//        
//        view.addSubview(greetingsLbl)
//        view.addSubview(tableView)
//        
//        setupConstraints()
//        
//        loadData()
//    }
//    
//    private func loadData() {
//        let service = NetworkService()
//        service.sendRequest { [weak self] items in
//            DispatchQueue.main.async {
//                self?.tableData = items
//                self?.tableView.reloadData()
//            }
//        }
//    }
//    
//        
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            greetingsLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
//            greetingsLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            greetingsLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            
//            tableView.topAnchor.constraint(equalTo: greetingsLbl.bottomAnchor, constant: 30),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//    }
//
//}
//
//extension MainViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ItemCell else {
//            return UITableViewCell() //если будет ошибка(nil там, где "Cell"), то вернется просто пустая ячейка
//        }
//        cell.setupCell(item: tableData[indexPath.row])
//        cell.selectionStyle = .none
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        tableData.count
//    }
//}
//
//extension MainViewController: UITableViewDelegate {}
