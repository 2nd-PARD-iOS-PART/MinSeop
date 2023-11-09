//
//  ThirdViewController.swift
//  HW5
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit

class ThirdViewController: UIViewController {

    var tableView = UITableView(frame: .zero, style: .grouped)

    // 데이터 배열 및 섹션 헤더 설정
    
    let imageNames: [String] = ["data2", "data1", "set1", "set2", "set3", "set4", "set1", "set2", "set3"]

    let data:[String] = ["New Arrival","New Arrival","New Arrival","New Arrival","New Arrival","New Arrival","New Arrival","New Arrival","New Arrival"]
    let name:[String] = ["El Chapo","Peaky Blinders","El Chapo","Peaky Blinders","El Chapo","hello","world","El Chapo","El Chapo"]
    let sub: [String] = ["Nov6","Nov6","Nov6","Nov6","Nov6","Nov6","Nov6","Nov6","Nov6","Nov6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground // 뷰의 배경색 설정
        self.view.addSubview(self.tableView)         // 테이블 뷰를 뷰에 추가
        self.tableView.dataSource = self         // 테이블 뷰의 데이터 소스 및 델리게이트 설정
        self.tableView.delegate = self
        
        configureNavbar() // 네비게이션 바 설정
        setTableView() // 테이블 뷰 설정 함수 호출
        
    }
    
    
    func setTableView() {     // 테이블 뷰 설정 함수
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    private func configureNavbar() {     // 네비게이션 바 설정 함수
        var image = UIImage(named: "alarm")   // 'alarm' 이미지를 가져와 'image' 상수에 할당
        image = image?.withRenderingMode(.alwaysOriginal)  // 이미지의 렌더링 모드를 항상 원본으로 설정
        let logo = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(barButtonPressed))
        let item1 = UIBarButtonItem(title: "Notifications", style: .plain, target: self, action: #selector(barButtonPressed))
        item1.tintColor = UIColor.white
        navigationItem.leftBarButtonItems = [logo, item1] // 네비게이션 바의 왼쪽 바 버튼 아이템으로 'logo', 'item1' 설정
    }
    
    // 네비게이션 바 버튼 클릭 시 호출되는 함수
    @objc private func barButtonPressed() {
        // 네비게이션 바 버튼 클릭 시 동작을 추가할 수 있습니다.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds // 테이블 뷰 프레임을 뷰와 동일하게 설정
    }
}

extension ThirdViewController: UITableViewDataSource {
    // 섹션 내 행 수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // 특정 행의 셀 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UpcomingTableViewCell(style: .default, reuseIdentifier: .none)
        
        cell.customtitleLabel.text = data[indexPath.row]
        cell.customDaytitleLabel.text = name[indexPath.row]
        cell.customSubtitleLabel.text = sub[indexPath.row]

        cell.customImageView.image = UIImage(named: imageNames[indexPath.row])
        
        return cell
    }
    
    // 스크롤 시 네비게이션 바 이동 및 크기 조절
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    // 섹션 헤더의 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension ThirdViewController: UITableViewDelegate {
    // 특정 행의 높이 반환
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
