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
    
    lazy var nextButton: UIButton = {
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
        let downloadButton = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(DownloadButtonPressed))
        downloadButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = downloadButton

        let trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashButtonPressed))
        trashButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = trashButton
    }

    func makeUi() {
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 280),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60)
        ])
        
        let myScrollView = UIScrollView()
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myScrollView)
        
        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .black
        myScrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor),
        ])
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movies and TV shows that you\ndownload appear here."
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        
        contentView.addSubview(label)
        
        let imageView = UIImageView(image: UIImage(named: "Image"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 474),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            
            imageView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 248),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 110),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -110)
        ])
    }
    
    
    @objc func FindSomethingtoDownloadbuttonPressed(){
        print("gdgd")
        let addMovieVC = DownloadsViewController()
        let navController = UINavigationController(rootViewController: addMovieVC)
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func buttonPressed(){
        
    }
    
    @objc func DownloadButtonPressed() {
        print("gdgd")
    }
    @objc func trashButtonPressed() {
        print("gdgd")
    }


}
