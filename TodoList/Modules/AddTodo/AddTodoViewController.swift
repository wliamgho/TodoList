//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by Ajaib on 26/05/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit
import SnapKit

class AddTodoViewController: UIViewController {
    private lazy var contentView: AddTodoContentView = {
        let view = AddTodoContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(contentView)

        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
