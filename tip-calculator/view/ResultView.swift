//
//  ResultView.swift
//  tip-calculator
//
//  Created by Huynh Nguyen Tuan Duy on 21/9/24.
//

import Foundation
import UIKit

class ResultView: UIView {
    init(){
        super.init(frame: .zero)
        layout()
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    private func layout() {
        backgroundColor = .orange
    }
}
