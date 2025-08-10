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
    
    lazy var cellLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return $0
    }(UILabel())
    
    
    lazy var cellView: UIView = {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return $0
    }(UIView())

    
    lazy var cellImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 30
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
        cellLabel.text = nil
    }
     
    
    func setupCell(item: Item) { //параметр: массив данных (модель)
        cellLabel.text = item.title
        cellImage.image = UIImage(named: item.image)
//        contentView.addSubview(cellView)
//        cellView.addSubview(cellImage)
//        cellImage.addSubview(cellLabel)
//        cellImage.addSubview(btn)
        
        
//        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 1),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
}

