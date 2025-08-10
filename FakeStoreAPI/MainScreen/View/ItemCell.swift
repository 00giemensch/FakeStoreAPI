//
//  ItemCell.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 10.08.2025.
//

import UIKit
import Kingfisher

final class ItemCell: UITableViewCell {
    
    var completion: ( () -> Void )?
    
    
    lazy var btn: UIButton = {
        $0.backgroundColor = .blue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 20
        $0.setTitle("Купить", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: action))
    
    lazy var action = UIAction(handler: { [weak self] _ in
        self?.completion?()
    })
    
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
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    override func prepareForReuse() {
        cellImage.image = nil
        cellTitleLbl.text = nil
    }
     
    
    func setupCell(item: StoreItem) {
        cellTitleLbl.text = item.title
        cellPriceLbl.text = String(item.price!)
        
        if let urlString = item.image, let url = URL(string: urlString) {
                cellImage.kf.setImage(with: url)
            } else {
                cellImage.image = nil
            }
        
        contentView.addSubview(cellTitleLbl)
        contentView.addSubview(cellPriceLbl)
        contentView.addSubview(cellImage)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            cellTitleLbl.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 1),
            cellTitleLbl.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 16),
            cellTitleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellTitleLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellPriceLbl.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 1),
            cellPriceLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellPriceLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
}
