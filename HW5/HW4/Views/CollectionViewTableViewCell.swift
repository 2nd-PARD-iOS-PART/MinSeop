//
//  CollectionViewTableViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"

    // 셀 내부에 포함될 컬렉션 뷰 선언
    private let collectionView: UICollectionView = {
        // 컬렉션 뷰 레이아웃 설정
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.scrollDirection = .horizontal
        // 컬렉션 뷰 생성
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // 셀 등록
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    
    // 셀 초기화 메서드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black // 셀 배경색 설정
        contentView.addSubview(collectionView) // 컬렉션 뷰를 셀의 하위 뷰로 추가

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    // 컬렉션 뷰 섹션 내 항목 수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return MovieData.MovieModelData[section].image.count
        
    }

    // 컬렉션 뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        return cell
    }
}
