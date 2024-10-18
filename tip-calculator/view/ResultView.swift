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
        backgroundColor = .white
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(24)
            make.leading.equalTo(snp.leading).offset(24)
            make.bottom.equalTo(snp.bottom).offset(-24)
            make.trailing.equalTo(snp.trailing).offset(-24)
        }
        horizontalLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        addShadow(offset: CGSize(width: 0, height: 3),
                  color: .black,
                  radius: 12,
                  opacity: 0.1)
        
    }
    private let label: UILabel = {
        LabelFactory.build(text: "Tổng mỗi người:", font: ThemeFont.demibold(ofSize: 18))
    }()
    private let amountPerPersonLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [
                .font: ThemeFont.bold(ofSize: 48)
            ]
        )
        text.addAttributes(
            [
                .font: ThemeFont.bold(ofSize: 24)
            ],
            //start from the position 0 and with the length of 1
            range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    //seperator view
    private let horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.seperator
        return view
    }()
    private func buildSpacerView(height: CGFloat) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
    //vertical stack view
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            label,
            amountPerPersonLabel,
            horizontalLineView,
            buildSpacerView(height: 0),
            hStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            AmountView(title: "Tổng bill", textAlignment: .left),
            UIView(),
            AmountView(title: "Tổng tip", textAlignment: .right)
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
}


#Preview{
    ResultView()
}
