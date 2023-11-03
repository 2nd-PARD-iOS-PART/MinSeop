//
//  SubView.swift
//  DelegateSample
//
//  Created by 김민섭 on 2023/10/28.
//

import UIKit

class SubView: UIView {
    var delegate: SubViewDelegate? // 서브뷰에 딜리게이트를 설정해놨음

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        delegate?.subViewTouchDidMove()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        delegate?.subViewTouchDidEnd()
    }
}

protocol SubViewDelegate {
    func subViewTouchDidMove()
    func subViewTouchDidEnd()
}
