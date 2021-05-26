//
//  TodoListContentView.swift
//  TodoList
//
//  Created by Ajaib on 26/05/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit
import SnapKit

class TodoListContentView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("TodoListContentView init(coder:) has not been implemented")
    }

    private func configureLayout() {
        self.backgroundColor = .white
    }
}
