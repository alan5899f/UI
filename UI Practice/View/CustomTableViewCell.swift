//
//  CustomTableViewCell.swift
//  UI Practice
//
//  Created by 陳韋綸 on 2022/11/3.
//

import UIKit
import Nuke

class CustomTableViewCell: UITableViewCell {
    
    private let userImageView = UIImageView().normal()
    private let username = UILabel().normal(font: .systemFont(ofSize: 16), textColor: .black)
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.estimatedItemSize = .zero
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()

    static let identifier = "CustomTableViewCell"
    
    private var tags = [String]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImageView)
        contentView.addSubview(username)
        contentView.addSubview(collectionView)
        userImageView.layer.cornerRadius = 25
        userImageView.backgroundColor = .systemGray3
        setupLayout()
    }
    
    private func setupLayout() {
        userImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor ,width: 50, height: 50)
        username.anchor(left: userImageView.rightAnchor, centerY: userImageView.centerYAnchor, leftPadding: 20)
        collectionView.anchor(top: userImageView.bottomAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, height: 100, topPadding: 10, bottomPadding: 10)
    }
    
    

    func configure(model: Item) {
        Nuke.loadImage(with: model.user.imageUrl, into: userImageView)
        username.text = model.user.nickName
        self.tags = model.tags
        self.collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
         fatalError()
    }
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        let tagText = tags[indexPath.row]
        cell.configure(tagText: tagText)
        return cell
    }
}
