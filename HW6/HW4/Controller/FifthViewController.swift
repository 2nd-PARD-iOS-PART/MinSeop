//
//  FifthViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit


class FifthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 2. 이미지 뷰 생성 및 설정
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "도둑들") // 이미지 이름을 실제 이미지 파일 이름으로 대체
        imageView.contentMode = .scaleAspectFit // 이미지를 화면 크기에 맞게 조정
        view.addSubview(imageView)

        // 3. 버튼 생성 및 설정
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "netflixSeries"), for: .normal) // 이미지 이름을 실제 이미지 파일 이름으로 대체
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // 버튼 액션 설정
        view.addSubview(button)

        // 4. 라벨 생성 및 설정
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "도둑들"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold) // 폰트 설정
        label.textColor = .white // 글자색을 흰색으로 설정
        view.addSubview(label)

        // 5. 패널 이미지 버튼 생성 및 설정
        let panel = UIButton()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.setImage(UIImage(named: "panel"), for: .normal) // 이미지 이름을 실제 이미지 파일 이름으로 대체
        panel.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // 버튼 액션 설정
        view.addSubview(panel)

        // 6. Play 버튼 생성 및 설정
        let playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("Play", for: .normal)
        playButton.backgroundColor = .white // 배경색을 흰색으로 설정
        playButton.setTitleColor(.black, for: .normal) // 텍스트 색상 설정
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        view.addSubview(playButton)

        // 7. Download 버튼 생성 및 설정
        let downloadButton = UIButton()
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.backgroundColor = .gray // 배경색을 회색으로 설정
        downloadButton.setTitleColor(.white, for: .normal) // 텍스트 색상 설정
        downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        view.addSubview(downloadButton)
        
        // 8. 클릭 버튼 아이콘 설정
        let clickIcon = UIImage(systemName: "hand.tap.fill") // 클릭 버튼 아이콘 이미지
        let clickButton = UIButton()
        clickButton.translatesAutoresizingMaskIntoConstraints = false
        clickButton.setImage(clickIcon, for: .normal) // 클릭 버튼 아이콘 설정
        clickButton.tintColor = .black // 아이콘 색상 설정
        view.addSubview(clickButton)

        // 9. pre 라벨 생성 및 설정
        let pre = UILabel()
        pre.translatesAutoresizingMaskIntoConstraints = false
        pre.text = "S5:E10 Nothing Remains The Same"
        pre.font = UIFont.systemFont(ofSize: 18, weight: .bold) // 폰트 설정
        pre.textColor = .white // 글자색을 흰색으로 설정
        view.addSubview(pre)

        // 10. tex 라벨 생성 및 설정
        let tex = UILabel()
        tex.translatesAutoresizingMaskIntoConstraints = false
        tex.text = "Hearts flip as Heather weds Tarek. Jason and Mary grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions."
        tex.font = UIFont.systemFont(ofSize: 14, weight: .light) // 폰트 설정
        tex.textColor = .white // 글자색을 흰색으로 설정
        tex.numberOfLines = 0 // 여러 줄에 걸친 텍스트를 표시할 수 있도록 설정
        view.addSubview(tex)

        // 11. 이미지 버튼 1 생성 및 설정
        let imageButton1 = UIButton()
        imageButton1.translatesAutoresizingMaskIntoConstraints = false
        imageButton1.setImage(UIImage(named: "add"), for: .normal)
        view.addSubview(imageButton1)

        // Label for imageButton1
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "My List"
        label1.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label1.textColor = .white
        view.addSubview(label1)

        // 12. 이미지 버튼 2 생성 및 설정
        let imageButton2 = UIButton()
        imageButton2.translatesAutoresizingMaskIntoConstraints = false
        imageButton2.setImage(UIImage(named: "good"), for: .normal)
        view.addSubview(imageButton2)

        // Label for imageButton2
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "Rate"
        label2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label2.textColor = .white
        view.addSubview(label2)

        // 13. 이미지 버튼 3 생성 및 설정
        let imageButton3 = UIButton()
        imageButton3.translatesAutoresizingMaskIntoConstraints = false
        imageButton3.setImage(UIImage(named: "share"), for: .normal)
        view.addSubview(imageButton3)

        // Label for imageButton3
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.text = "Share"
        label3.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label3.textColor = .white
        view.addSubview(label3)
        
//        // 8. 탭 바 컨트롤러 생성
//        let tabBarController = UITabBarController()
//
//        // 9. 각 탭에 해당하는 뷰 컨트롤러 생성
//        let tab1ViewController = UIViewController()
//        let tab2ViewController = UIViewController()
//        let tab3ViewController = UIViewController()
//        let tab4ViewController = UIViewController()
//
//        // 10. 각 탭에 타이틀 및 아이콘 지정
//        tab1ViewController.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "1.square.fill"), tag: 0)
//        tab2ViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "2.square.fill"), tag: 1)
//        tab3ViewController.tabBarItem = UITabBarItem(title: "More Like This", image: UIImage(systemName: "3.square.fill"), tag: 2)
//        tab4ViewController.tabBarItem = UITabBarItem(title: "Trailers & More", image: UIImage(systemName: "4.square.fill"), tag: 3)
//
//        // 11. 각 탭 뷰 컨트롤러를 탭 바 컨트롤러에 추가
//        tabBarController.viewControllers = [tab1ViewController, tab2ViewController, tab3ViewController, tab4ViewController]
//
//        // 12. 탭 바 컨트롤러를 현재 뷰 컨트롤러에 추가
//        self.addChild(tabBarController)
//        self.view.addSubview(tabBarController.view)
//        tabBarController.didMove(toParent: self)
//
//        // 탭 바 위치 설정
//        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(tabBarController.view)
//
        // 11. 오토 레이아웃 설정
        NSLayoutConstraint.activate([

            // 이미지 뷰 위치 설정
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // 왼쪽 정렬
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            // 버튼 위치 설정
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor), // 왼쪽 정렬

            // 라벨 위치 설정
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor), // 왼쪽 정렬
            
            // 패널 위치 설정
            panel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            panel.leadingAnchor.constraint(equalTo: view.leadingAnchor), // 왼쪽 정렬

            // 클릭 버튼 아이콘 위치 설정
            clickButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            clickButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -10), // Play 버튼의 왼쪽에 위치

            // Play 버튼 위치 설정
            playButton.topAnchor.constraint(equalTo: panel.bottomAnchor, constant: 10),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor), // 왼쪽 정렬
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor), // 오른쪽 정렬
            playButton.widthAnchor.constraint(equalTo: view.widthAnchor),

            // Download 버튼 위치 설정
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 10),
            downloadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor), // 왼쪽 정렬
            downloadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor), // 오른쪽 정렬
            downloadButton.heightAnchor.constraint(equalToConstant: 40), // Download 버튼의 높이 설정

            // pre 라벨 위치 설정
            pre.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 20),
            pre.leadingAnchor.constraint(equalTo: view.leadingAnchor), // 왼쪽 정렬

            // tex 라벨 위치 설정
            tex.topAnchor.constraint(equalTo: pre.bottomAnchor, constant: 10),
            tex.leadingAnchor.constraint(equalTo: view.leadingAnchor), // 왼쪽 정렬
            tex.trailingAnchor.constraint(equalTo: view.trailingAnchor), // 오른쪽 정렬

            // 이미지 버튼 1 위치 설정
            imageButton1.topAnchor.constraint(equalTo: tex.bottomAnchor, constant: 20),
            imageButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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
//
//            tabBarController.view.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 60),
//            tabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
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



