//
//  AmountView.swift
//  tip-calculator
//
//  Created by Huynh Nguyen Tuan Duy on 13/10/24.
//

import Foundation
import UIKit
class AmountView: UIView {
    private let title: String
    private let textAlignment: NSTextAlignment
    private lazy var titleLabel:UILabel = {
        LabelFactory.build(text: title,
                           font: ThemeFont.regular(ofSize: 18),
                           textColor: ThemeColor.text,
                           textAlignment: textAlignment
        )
    }()
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = textAlignment
        label.textColor = ThemeColor.primary
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [
            .font: ThemeFont.bold(ofSize: 24),
        ])
        text.addAttributes([
            .font: ThemeFont.bold(ofSize: 16)
        ],range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            amountLabel
        ])
        stackView.axis = .vertical
        
        return stackView
    }()
    init(title: String, textAlignment: NSTextAlignment){
        self.title = title
        self.textAlignment = textAlignment
        //because we gonna use autolayout
        super.init(frame: .zero)
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: -Auto layout function
    private func layout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            //no padding so just align to the damn edge
            make.edges.equalToSuperview()
        }
    }
}
