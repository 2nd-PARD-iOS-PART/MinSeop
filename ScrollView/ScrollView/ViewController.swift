//
//  ViewController.swift
//  ScrollView
//
//  Created by 김민섭 on 2023/10/29.
//

import UIKit

class ViewController: UIViewController {

    let scrollView : UIScrollView! = UIScrollView()
    let contentView : UIView! = UIView()
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        // Do any additional setup after loading the view.
        
        layde()
    }
    
    func layde() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        contentView.addSubview(movieTitle)
        contentView.addSubview(movieImage)
        contentView.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150),
                    
            movieImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieImage.widthAnchor.constraint(equalToConstant: 300),
            movieImage.heightAnchor.constraint(equalToConstant: 300),
            movieImage.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 40),
                    
            movieDescription.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 40),
            movieDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    
    
}

