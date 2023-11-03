//
//  ViewController.swift
//  DelegateSample
//
//  Created by 김민섭 on 2023/10/28.
//

import UIKit

class ViewController: UIViewController {
    typealias NumberModel = Int
    
    var count: NumberModel = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }// Model이면 좋다
    
    lazy var subView: SubView = {
        let view = SubView(frame: .init(
            origin: .init(x: 50, y: 50),
            size: .init(width: 300, height: 300)
        ))
        view.delegate = self // self는 ViewController이고 뷰컨트롤러가 SubViewDelegate로 설정이 되어서 delegate 설정가능
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel(frame: .init(
            origin: .init(x: 50, y: 400),
            size: .init(width: 100, height: 50)
        ))
        label.backgroundColor = .yellow
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(subView)
        view.addSubview(countLabel)
    }
}

extension ViewController: SubViewDelegate {
    func subViewTouchDidMove() {
        count += 1
    }
    
    func subViewTouchDidEnd() {
        
    }
    
}

