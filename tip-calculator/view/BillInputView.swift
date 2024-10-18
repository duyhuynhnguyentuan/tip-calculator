//
//  BillInputView.swift
//  tip-calculator
//
//  Created by Huynh Nguyen Tuan Duy on 21/9/24.
//

import Foundation
import UIKit
class BillInputView: UIView {
    private let headerView: HeaderView = {
        return HeaderView()
    }()
    private let textFieldContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(radius: 8.0)
        return view
    }()
    private let currencyDenominationLabel: UILabel = {
        let label = LabelFactory.build(text: "$",
                           font: ThemeFont.bold(ofSize: 24))
        //This prevents content from being squeezed and often ensures that the content is fully displayed.
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    private lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.font = ThemeFont.demibold(ofSize: 28)
        textfield.keyboardType = .numberPad
        textfield.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textfield.tintColor = ThemeColor.text
        textfield.textColor = ThemeColor.text
        //Add toolbar
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 36))
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Xong",
                                         style: .plain,
                                         target: self,
                                         action: #selector(doneButtonTapped))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil),
            doneButton
        ]
        toolBar.isUserInteractionEnabled = true
        textfield.inputAccessoryView = toolBar
        return textfield
    }()
    init(){
        super.init(frame: .zero)
        layout()
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    private func layout() {
        [headerView, textFieldContainerView].forEach(addSubview(_:))
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(textFieldContainerView.snp.centerY)
            make.width.equalTo(68)
            make.trailing.equalTo(textFieldContainerView.snp.leading).offset(-24)
        }
        textFieldContainerView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        textFieldContainerView.addSubview(currencyDenominationLabel)
        textFieldContainerView
            .addSubview(textField)
        currencyDenominationLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
        }
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(currencyDenominationLabel.snp.trailing).offset(16)
            make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
        
    }
    @objc private func doneButtonTapped() {
        textField.endEditing(true)
    }
}

class HeaderView: UIView {
    private let topLabel: UILabel = {
        LabelFactory.build(text: "Enter",
                           font: ThemeFont.bold(ofSize: 18))
    }()
    private let bottomLabel: UILabel = {
        LabelFactory.build(text: "your bill",
                           font: ThemeFont.regular(ofSize: 16))
    }()
    init(){
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func layout() {
        backgroundColor = .systemBlue
    }
}

#Preview {
    BillInputView()
}
