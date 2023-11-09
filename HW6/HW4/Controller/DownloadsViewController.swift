//
//  DownloadsViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/11/09.
//

import UIKit

class DownloadsViewController: UIViewController {
    
    private let movieTitleTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            print("ㅎㅇㅎㅇ3")

            layout()
        }
        
        private func layout() {
            print("ㅎㅇㅎㅇ2")

            view.addSubview(movieTitleTextField)
        }
}

