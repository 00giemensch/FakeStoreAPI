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
    
    lazy var cellTitleLbl: UILabel = setupLbl(size: 18, weight: .semibold, color: .black)
    lazy var cellPriceLbl: UILabel = setupLbl(size: 16, weight: .medium, color: .systemGreen)
    
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
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        
        contentView.addSubview(cellTitleLbl)
        contentView.addSubview(cellPriceLbl)
        contentView.addSubview(cellImage)
        setupConstraints()
    }
    
    override func prepareForReuse() {
        cellImage.image = nil
        cellTitleLbl.text = nil
    }
     
    
    func configuration(item: StoreItem) {
        cellTitleLbl.text = item.title ?? "Без названия"
        cellPriceLbl.text = "$\((item.price!))"
        
        if let urlString = item.image, let url = URL(string: urlString) {
                cellImage.kf.setImage(with: url)
            } else {
                cellImage.image = nil
            }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            
            cellTitleLbl.topAnchor.constraint(equalTo: cellImage.topAnchor,constant: 3),
            cellTitleLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellTitleLbl.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 16),
            cellTitleLbl.trailingAnchor.constraint(equalTo: cellPriceLbl.leadingAnchor, constant: -8),
            
            cellPriceLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellPriceLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellPriceLbl.widthAnchor.constraint(equalToConstant: 80),
            
            cellTitleLbl.trailingAnchor.constraint(equalTo: cellPriceLbl.leadingAnchor, constant: -8),
        ])
    }
    
    func setupLbl(size: Int, weight: UIFont.Weight, color: UIColor) -> UILabel {
        let lbl: UILabel = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        lbl.textColor = color
        lbl.textAlignment = .right
        return lbl
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
}
