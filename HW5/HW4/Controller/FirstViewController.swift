//
//  FirstViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit

class FirstViewController: UIViewController {
    // 섹션 타이틀 배열
    let sectionTitles: [String] = ["Previews", "Continue Watching for MinSeop Kim", "My List", "Europe movie", "Romance/Drama", "Action/Thriller"]

    // 홈 피드 테이블 뷰 생성
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped) // grouped : 각 섹션에 고유한 행들의 그룹이 있는 스타일
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier) // 셀 등록
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // 시스템 배경색 설정
        view.addSubview(homeFeedTable) // 뷰에 테이블 뷰 추가

        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        configureNavbar() // 네비게이션 바 설정

        let headerView = MediaViewCell(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450)) // 헤더 뷰 생성
        homeFeedTable.tableHeaderView = headerView // 테이블 뷰의 헤더 뷰 설정
    }

    // 네비게이션 바 설정 함수
    private func configureNavbar() {
        // 'netflixImage' 이미지를 가져와 'image' 상수에 할당
        var image = UIImage(named: "netflixImage")
        // 이미지의 렌더링 모드를 항상 원본으로 설정
        image = image?.withRenderingMode(.alwaysOriginal)

        // 'logo'라는 바 버튼 아이템을 생성하고 이미지, 스타일, 대상 및 액션을 설정
        let logo = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(barButtonPressed))

        // 'item1', 'item2', 'item3' 세 개의 바 버튼 아이템을 생성하고 각각 제목, 스타일, 대상, 액션을 설정
        let item1 = UIBarButtonItem(title: "TV Shows", style: .plain, target: self, action: #selector(barButtonPressed))
        let item2 = UIBarButtonItem(title: "Movie", style: .plain, target: self, action: #selector(barButtonPressed))
        let item3 = UIBarButtonItem(title: "My List", style: .plain, target: self, action: #selector(barButtonPressed))

        // 'item1', 'item2', 'item3' 바 버튼 아이템의 틴트 색상을 흰색으로 설정
        item1.tintColor = UIColor.white
        item2.tintColor = UIColor.white
        item3.tintColor = UIColor.white

        // 네비게이션 바의 왼쪽 바 버튼 아이템으로 'logo', 'item1', 'item2', 'item3' 설정
        navigationItem.leftBarButtonItems = [logo, item1, item2, item3]
    }


    // 네비게이션 바 버튼 클릭 시 호출되는 함수
    @objc private func barButtonPressed() {
        // 네비게이션 바 버튼 클릭 시 동작을 추가할 수 있습니다.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds // 테이블 뷰 프레임 설정
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count // 섹션 수 반환
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // 각 섹션의 행 수 반환
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            print("Failed to dequeue CollectionViewTableViewCell")
            return UITableViewCell()
        }

        let dataImage = MovieModel.ModelData[indexPath.section][indexPath.row]
        cell.imageView?.image = UIImage(named: dataImage.image )
    
        
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

    // 섹션 헤더의 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    // 섹션 헤더 스타일 설정
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }

    // 각 섹션의 행 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 180
        case 1:
            return 250
        default:
            return 200
        }
    }
}
