//
//  FifthViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit


class FifthViewController: UIViewController {
    
//    var tableView = UITableView(frame: .zero, style: .grouped)
//
//    let imageNames: [String] = ["data2", "data1", "set1", "set2", "set3", "set4", "set1", "set2", "set3"]
//
//    let data:[String] = ["New Arrival","New Arrival","New Arrival","New Arrival","New Arrival","New Arrival","New Arrival","New Arrival","New Arrival"]
//    let name:[String] = ["El Chapo","Peaky Blinders","El Chapo","Peaky Blinders","El Chapo","hello","world","El Chapo","El Chapo"]
//    let sub: [String] = ["Nov6","Nov6","Nov6","Nov6","Nov6","Nov6","Nov6","Nov6","Nov6","Nov6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setTableView()
        
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        self.tableView.dataSource = self         // 테이블 뷰의 데이터 소스 및 델리게이트 설정
//        self.tableView.delegate = self
//        tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: "UpcomingTableViewCell")
        
        // 1. 스크롤 뷰 생성 및 설정
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
//      view.addSubview(tableView)

        // 2. 이미지 뷰 생성 및 설정
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "도둑들") // 이미지 이름을 실제 이미지 파일 이름으로 대체
        imageView.contentMode = .scaleAspectFit // 이미지를 화면 크기에 맞게 조정
        scrollView.addSubview(imageView)

        // 3. 버튼 생성 및 설정
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "netflixSeries"), for: .normal) // 이미지 이름을 실제 이미지 파일 이름으로 대체
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // 버튼 액션 설정
        scrollView.addSubview(button)

        // 4. 라벨 생성 및 설정
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "도둑들"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold) // 폰트 설정
        label.textColor = .white // 글자색을 흰색으로 설정
        scrollView.addSubview(label)

        // 5. 패널 이미지 버튼 생성 및 설정
        let panel = UIButton()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.setImage(UIImage(named: "panel"), for: .normal) // 이미지 이름을 실제 이미지 파일 이름으로 대체
        panel.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // 버튼 액션 설정
        scrollView.addSubview(panel)

        // 6. Play 버튼 생성 및 설정
        let playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("Play", for: .normal)
        playButton.backgroundColor = .white // 배경색을 흰색으로 설정
        playButton.setTitleColor(.black, for: .normal) // 텍스트 색상 설정
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        scrollView.addSubview(playButton)

        // 7. Download 버튼 생성 및 설정
        let downloadButton = UIButton()
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.backgroundColor = .gray // 배경색을 회색으로 설정
        downloadButton.setTitleColor(.white, for: .normal) // 텍스트 색상 설정
        downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        scrollView.addSubview(downloadButton)
        
        // 8. 클릭 버튼 아이콘 설정
        let clickIcon = UIImage(systemName: "hand.tap.fill") // 클릭 버튼 아이콘 이미지
        let clickButton = UIButton()
        clickButton.translatesAutoresizingMaskIntoConstraints = false
        clickButton.setImage(clickIcon, for: .normal) // 클릭 버튼 아이콘 설정
        clickButton.tintColor = .black // 아이콘 색상 설정
        scrollView.addSubview(clickButton)

        // 9. pre 라벨 생성 및 설정
        let pre = UILabel()
        pre.translatesAutoresizingMaskIntoConstraints = false
        pre.text = "S5:E10 Nothing Remains The Same"
        pre.font = UIFont.systemFont(ofSize: 18, weight: .bold) // 폰트 설정
        pre.textColor = .white // 글자색을 흰색으로 설정
        scrollView.addSubview(pre)

        // 10. tex 라벨 생성 및 설정
        let tex = UILabel()
        tex.translatesAutoresizingMaskIntoConstraints = false
        tex.text = "Hearts flip as Heather weds Tarek. Jason and Mary grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions."
        tex.font = UIFont.systemFont(ofSize: 14, weight: .light) // 폰트 설정
        tex.textColor = .white // 글자색을 흰색으로 설정
        tex.numberOfLines = 0 // 여러 줄에 걸친 텍스트를 표시할 수 있도록 설정
        scrollView.addSubview(tex)

        // 11. 이미지 버튼 1 생성 및 설정
        let imageButton1 = UIButton()
        imageButton1.translatesAutoresizingMaskIntoConstraints = false
        imageButton1.setImage(UIImage(named: "add"), for: .normal)
        scrollView.addSubview(imageButton1)

        // Label for imageButton1
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "My List"
        label1.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label1.textColor = .white
        scrollView.addSubview(label1)

        // 12. 이미지 버튼 2 생성 및 설정
        let imageButton2 = UIButton()
        imageButton2.translatesAutoresizingMaskIntoConstraints = false
        imageButton2.setImage(UIImage(named: "good"), for: .normal)
        scrollView.addSubview(imageButton2)

        // Label for imageButton2
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "Rate"
        label2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label2.textColor = .white
        scrollView.addSubview(label2)

        // 13. 이미지 버튼 3 생성 및 설정
        let imageButton3 = UIButton()
        imageButton3.translatesAutoresizingMaskIntoConstraints = false
        imageButton3.setImage(UIImage(named: "share"), for: .normal)
        scrollView.addSubview(imageButton3)

        // Label for imageButton3
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.text = "Share"
        label3.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label3.textColor = .white
        scrollView.addSubview(label3)
        // 스크롤 뷰의 컨텐츠 사이즈 설정
        scrollView.contentSize = CGSize(width: view.frame.width, height: label3.frame.origin.y + label3.frame.size.height + 20)
        
        // 8. 탭 바 컨트롤러 생성
        let tabBarController = UITabBarController()
        
        // 9. 각 탭에 해당하는 뷰 컨트롤러 생성
        let tab1ViewController = UIViewController()
        let tab2ViewController = UIViewController()
        let tab3ViewController = UIViewController()
        let tab4ViewController = UIViewController()

        // 10. 각 탭에 타이틀 및 아이콘 지정
        tab1ViewController.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "1.square.fill"), tag: 0)
        tab2ViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "2.square.fill"), tag: 1)
        tab3ViewController.tabBarItem = UITabBarItem(title: "More Like This", image: UIImage(systemName: "3.square.fill"), tag: 2)
        tab4ViewController.tabBarItem = UITabBarItem(title: "Trailers & More", image: UIImage(systemName: "4.square.fill"), tag: 3)

        // 11. 각 탭 뷰 컨트롤러를 탭 바 컨트롤러에 추가
        tabBarController.viewControllers = [tab1ViewController, tab2ViewController, tab3ViewController, tab4ViewController]

        // 12. 탭 바 컨트롤러를 현재 뷰 컨트롤러에 추가
        self.addChild(tabBarController)
        self.view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)

        // 탭 바 위치 설정
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(tabBarController.view)
        

        // 11. 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            // 스크롤 뷰 위치 설정
            scrollView.topAnchor.constraint(equalTo: view.topAnchor), // 네비게이션 바 부분에 채우도록 수정
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // 이미지 뷰 위치 설정
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), // 왼쪽 정렬
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // 버튼 위치 설정
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), // 왼쪽 정렬

            // 라벨 위치 설정
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), // 왼쪽 정렬
            
            // 패널 위치 설정
            panel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            panel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), // 왼쪽 정렬

            // 클릭 버튼 아이콘 위치 설정
            clickButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            clickButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -10), // Play 버튼의 왼쪽에 위치

            // Play 버튼 위치 설정
            playButton.topAnchor.constraint(equalTo: panel.bottomAnchor, constant: 10),
            playButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), // 왼쪽 정렬
            playButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor), // 오른쪽 정렬
            playButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Download 버튼 위치 설정
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 10),
            downloadButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), // 왼쪽 정렬
            downloadButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor), // 오른쪽 정렬
            downloadButton.heightAnchor.constraint(equalToConstant: 40), // Download 버튼의 높이 설정

            // pre 라벨 위치 설정
            pre.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 20),
            pre.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), // 왼쪽 정렬

            // tex 라벨 위치 설정
            tex.topAnchor.constraint(equalTo: pre.bottomAnchor, constant: 10),
            tex.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), // 왼쪽 정렬
            tex.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor), // 오른쪽 정렬

            // 이미지 버튼 1 위치 설정
            imageButton1.topAnchor.constraint(equalTo: tex.bottomAnchor, constant: 20),
            imageButton1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            imageButton1.widthAnchor.constraint(equalToConstant: 55),
            imageButton1.heightAnchor.constraint(equalToConstant: 55),
        
            // Label 1 위치 설정
            label1.topAnchor.constraint(equalTo: imageButton1.bottomAnchor, constant: 10),
            label1.centerXAnchor.constraint(equalTo: imageButton1.centerXAnchor),

            // 이미지 버튼 2 위치 설정
            imageButton2.topAnchor.constraint(equalTo: tex.bottomAnchor, constant: 20),
            imageButton2.leadingAnchor.constraint(equalTo: imageButton1.trailingAnchor, constant: 40),
            imageButton2.widthAnchor.constraint(equalToConstant: 55),
            imageButton2.heightAnchor.constraint(equalToConstant: 55),
        
            // Label 2 위치 설정
            label2.topAnchor.constraint(equalTo: imageButton2.bottomAnchor, constant: 10),
            label2.centerXAnchor.constraint(equalTo: imageButton2.centerXAnchor),

            // 이미지 버튼 3 위치 설정
            imageButton3.topAnchor.constraint(equalTo: tex.bottomAnchor, constant: 20),
            imageButton3.leadingAnchor.constraint(equalTo: imageButton2.trailingAnchor, constant: 40),
            imageButton3.widthAnchor.constraint(equalToConstant: 55),
            imageButton3.heightAnchor.constraint(equalToConstant: 55),

            // Label 3 위치 설정
            label3.topAnchor.constraint(equalTo: imageButton3.bottomAnchor, constant: 10),
            label3.centerXAnchor.constraint(equalTo: imageButton3.centerXAnchor),
            
            tabBarController.view.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 60),
            tabBarController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tabBarController.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tabBarController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ])
        // 스크롤 뷰의 컨텐츠 사이즈 설정
        //scrollView.contentSize = CGSize(width: view.frame.width, height: tex.frame.origin.y + tex.frame.size.height + 20)
    }

    @objc func buttonTapped() {
        // 버튼이 눌렸을 때 실행할 액션을 정의
    }

    @objc func playButtonTapped() {
        // Play 버튼이 눌렸을 때 실행할 액션을 정의
    }

    @objc func downloadButtonTapped() {
        // Download 버튼이 눌렸을 때 실행할 액션을 정의
    }
}

//extension FifthViewController: UITableViewDataSource {
//    // 섹션 내 행 수 반환
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//
//    // 특정 행의 셀 반환
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UpcomingTableViewCell(style: .default, reuseIdentifier: .none)
//
//        cell.customtitleLabel.text = data[indexPath.row]
//        cell.customDaytitleLabel.text = name[indexPath.row]
//        cell.customSubtitleLabel.text = sub[indexPath.row]
//
//        cell.customImageView.image = UIImage(named: imageNames[indexPath.row])
//
//        return cell
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffset = view.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffset
//
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
//    }
//
//}
//
//extension FifthViewController: UITableViewDelegate {
//    // 특정 행의 높이 반환
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//}
//

