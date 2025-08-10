//
//  ItemCell.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 10.08.2025.
//

import UIKit

final class ItemCell: UITableViewCell {
    
    var completion: ( () -> Void )?
    
    
    lazy var btn: UIButton = {
        let action = UIAction(handler: { [weak self] _ in
            self?.completion?()
        })
        let btn = UIButton(primaryAction: action)
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 20
        btn.setTitle("Купить", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
// Lbls
    lazy var cellTitleLbl: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    lazy var cellPriceLbl: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        $0.textColor = .systemGreen
        return $0
    }(UILabel())
//
    
    lazy var cellView: UIView = {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return $0
    }(UIView())

    
    lazy var cellImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
        $0.contentMode = .scaleAspectFill
//        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true //без этого кнопка не будет работать. Это нужно, если кнопка на UIImageView
        return $0
    }(UIImageView())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true //чтобы ничего не вылазило за рамки
    }
    
    override func prepareForReuse() {
        cellImage.image = nil
        cellTitleLbl.text = nil
    }
     
    
    func setupCell(item: Item) { //параметр: массив данных (модель)
        cellTitleLbl.text = item.title
        cellPriceLbl.text = item.price
        cellImage.image = UIImage(named: item.image)
//        contentView.addSubview(cellView)
//        cellView.addSubview(cellImage)
        contentView.addSubview(cellTitleLbl)
        contentView.addSubview(cellPriceLbl)
        contentView.addSubview(cellImage)
//        cellImage.addSubview(btn)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellTitleLbl.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 1),
            cellTitleLbl.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 16),
            cellTitleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellTitleLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellPriceLbl.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 1),
//            cellPriceLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellPriceLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellPriceLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
}

/*
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
 */
