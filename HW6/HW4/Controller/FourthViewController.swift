//
//  FourthViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit
import Realm

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUi()
        configureNavbar()
    }
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("Find Something to Download", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(FindSomethingtoDownloadbuttonPressed), for: .touchUpInside)
        return button
    }()
    
    private func configureNavbar() {
        let downloadButton = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(barButtonPressed))
        downloadButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = downloadButton

        let trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashButtonPressed))
        trashButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = trashButton
    }
    
    // 네비게이션 바 버튼 클릭 시 호출되는 함수
    @objc private func barButtonPressed() {
        // 네비게이션 바 버튼 클릭 시 동작을 추가할 수 있습니다.
    }
    
    func makeUi() {
        
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 280),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 550),
            nextButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 60)
        ])
        
        // MARK: - scrollView
        let myScrollView = UIScrollView()
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myScrollView)
        
        // MARK: - 스크롤뷰 auto layout
        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // MARK: - 스크롤뷰 content 추가
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .black
        myScrollView.addSubview(contentView)
        
        // MARK: - contentView의 오토레이아웃 설정
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor),
        ])
        
        // MARK: - contentView에 추가할 content 생성 및 설정
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movies and TV shows that you\ndownload appear here."
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        
        // MARK: - 스크롤 방향 설정
        contentView.addSubview(label)
        
        let imageView = UIImageView(image: UIImage(named: "Image"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        
        // MARK: - contentView 안의 contents의 오토레이아웃 설정
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 474),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            
            imageView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 248),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 110),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -110),
        ])
    }
    
    
    @objc func FindSomethingtoDownloadbuttonPressed(){
        let secondVC = DownloadsViewController()
        let navController = UINavigationController(rootViewController: secondVC)
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func buttonPressed(){
        
        //present(tabBarVC, animated: true, completion: nil)
    }
    
    @objc private func trashButtonPressed() {
        
    }


}
