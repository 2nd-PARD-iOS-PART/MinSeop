//
//  CollectionViewTableViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    // 'configure' 메서드 추가
    func configure(with models: [MovieModel]) {
        // 이 메서드를 통해 셀에 모델 데이터를 표시하고 설정할 수 있습니다.
        // 여기서 모델 데이터를 활용하여 이미지 또는 기타 셀 내용을 업데이트하세요.
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section < MovieData.MovieModelData.count {
            return MovieData.MovieModelData[section].images.count
        }
        
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        if indexPath.section < MovieData.MovieModelData.count {
            let imageNames = MovieData.MovieModelData[indexPath.section].images

            if indexPath.item < imageNames.count, let image = UIImage(named: imageNames[indexPath.item]) {
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFill
                imageView.frame = cell.contentView.bounds

                // Remove any existing subviews from the cell
                cell.contentView.subviews.forEach { $0.removeFromSuperview() }

                cell.contentView.addSubview(imageView)
            }
        }

        return cell
    }
}
