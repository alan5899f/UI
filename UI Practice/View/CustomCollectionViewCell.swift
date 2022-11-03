//
//  CustomCollectionViewCell.swift
//  UI Practice
//
//  Created by 陳韋綸 on 2022/11/3.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let tagLabel = UILabel().normal(font: .systemFont(ofSize: 14), textColor: .orange)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagLabel)
        tagLabel.backgroundColor = .yellow
        setupLayout()
    }
    
    private func setupLayout() {
        tagLabel.frame = contentView.bounds
    }
    
    func configure(tagText: String) {
        tagLabel.text = tagText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
