//
//  MainView.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 11.08.2025.
//

import UIKit

class MainView: UIView {
    
    lazy var tableView: UITableView = {
        $0.register(ItemCell.self, forCellReuseIdentifier: "Cell")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 100
        return $0
    }(UITableView())
    
    lazy var greetingsLbl: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.setContentHuggingPriority(.required, for: .horizontal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(greetingsLbl)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            greetingsLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 16),
            greetingsLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            greetingsLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: greetingsLbl.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
    func updateGreetings(username: String?) {
        greetingsLbl.text = "Привет, \(username!)!"
    }
    
}
