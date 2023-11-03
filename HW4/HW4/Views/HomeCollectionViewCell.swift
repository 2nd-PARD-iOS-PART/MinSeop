//
//  HomeCollectionViewCell.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/30.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    // 이미지를 표시할 이미지 뷰를 만듭니다.
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 이미지 뷰를 셀의 하위 뷰로 추가합니다.
        addSubview(imageView)
        imageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 이미지 뷰에 이미지를 할당하는 configure 메서드를 만듭니다.
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}

