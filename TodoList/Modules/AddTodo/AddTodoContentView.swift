//
//  AddTodoContentView.swift
//  TodoList
//
//  Created by Ajaib on 26/05/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit
import SnapKit

protocol AddTodoContentDelegate: AnyObject {
    func getTextField(_ text: String)
}

class AddTodoContentView: UIView {
    private lazy var todoField: UITextField = {
        let field = UITextField()
        field.placeholder = "Type Here"
        field.borderStyle = .roundedRect
        field.delegate = self
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    weak var delegate: AddTodoContentDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {
        self.backgroundColor = .white
        self.addSubview(todoField)
        todoField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(36)
        }
    }
}

extension AddTodoContentView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            delegate?.getTextField(text)
        }

        textField.resignFirstResponder()
        return true
    }
}
