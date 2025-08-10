//
//  MainViewController.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 09.08.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableData = Item.mockData()
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self //связь таблицы с моделью
        $0.delegate = self
        $0.register(ItemCell.self, forCellReuseIdentifier: "Cell")
//        $0.separatorStyle = .none //удаление линий между ячейками
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 100
//        $0.estimatedRowHeight = 100
//        $0.style = .insetGrouped
        return $0
    }(UITableView())
    
    let greetingsLbl: UILabel = {
        $0.text = "Привет, анонимный пользователь!"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.setContentHuggingPriority(.required, for: .horizontal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Магазин"
        
        view.addSubview(greetingsLbl)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingsLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            greetingsLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            greetingsLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: greetingsLbl.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    /*
     +-----------------------------------------------------+
     |                Название экрана (опц.)              |
     +-----------------------------------------------------+
     | [ Приветствие 👋 ]                                  | ← кнопка сверху
     +-----------------------------------------------------+
     |                                                     |
     | [Название товара 1]   -   $12.99                    | ← UITableView
     | [Название товара 2]   -   $8.49                     |
     | [Название товара 3]   -   $42.00                    |
     | ...                                                 |
     | [Название товара N]   -   $10.99                    |
     |                                                     |
     +-----------------------------------------------------+
    
     1. На экране 2 элемента:
     1. Динамическая таблица со списком элементов
     2. Кнопка «Приветствие»
     2. По нажатию на кнопку появляется модальное окно, в котором находится приветствие
     пользователя с указанием имени, которое было введено на экране регистрации.
     3. При заходе на экран отправляется запрос на сервер для получения элементов таблицы.
     4. Список API на выбор (можете выбрать любую):
     1. Спецификация API: https://fakestoreapi.com. Эндпоинт:
     https://fakestoreapi.com/products. Необходимо отобразить название (title) и цену
     (price). Остальные поля можете отображать по желанию.
     
     */

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ItemCell else {
            return UITableViewCell() //если будет ошибка(nil там, где "Cell"), то вернется просто пустая ячейка
        }
        cell.setupCell(item: tableData[indexPath.row])
        cell.selectionStyle = .none //убирает выделения при нажатии на ячейку
        
//        cell.completion = { [weak self] in
//            guard let self = self else { return }
//            let vc = SecondVC()
//            vc.title = self.tableData[indexPath.row].title
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count //count - поскольку нет секций
    }
}

extension MainViewController: UITableViewDelegate {}

