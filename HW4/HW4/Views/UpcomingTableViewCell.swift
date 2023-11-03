//
//  UpcomingTableViewCell.swift
//  HW5
//
//  Created by 김민섭 on 2023/10/30.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {
    let customImageView = UIImageView()
    let customtitleLabel = UILabel()
    let customDaytitleLabel = UILabel()
    let customSubtitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 이미지뷰 설정
        customImageView.contentMode = .scaleAspectFit
        contentView.addSubview(customImageView)
        
        // 제목 레이블 설정
        customtitleLabel.textColor = .white
        contentView.addSubview(customtitleLabel)
        
        // 이름 레이블 설정
        customDaytitleLabel.textColor = .white
        contentView.addSubview(customDaytitleLabel)
        
        // 소제목 레이블 설정
        customSubtitleLabel.textColor = .gray
        contentView.addSubview(customSubtitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 이미지뷰 및 레이블 프레임 설정
        customImageView.frame = CGRect(x: 10, y: 10, width: 80, height: 80) // 이미지뷰 크기 및 위치 설정
        customtitleLabel.frame = CGRect(x: 115, y: 20, width: contentView.frame.width - 130, height: 20) // 제목 레이블 크기 및 위치 설정
        customDaytitleLabel.frame = CGRect(x: 115, y: 40, width: contentView.frame.width - 130, height: 20) // 제목 레이블 크기 및 위치 설정
        customSubtitleLabel.frame = CGRect(x: 115, y: 60, width: contentView.frame.width - 110, height: 20) // 소제목 레이블 크기 및 위치 설정
    }
}
