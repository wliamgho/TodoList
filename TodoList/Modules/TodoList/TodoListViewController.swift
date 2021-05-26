//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Ajaib on 26/05/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit
import SnapKit

class TodoListViewController: UIViewController {
    private lazy var addButtonBar: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add,
                                     target: self,
                                     action: #selector(self.addButtonTapped))
        button.tintColor = .systemBlue
        return button
    }()

    private lazy var contentView: TodoListContentView = {
        let view = TodoListContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()

        self.view.addSubview(contentView)
        contentView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    private func configureNavigation() {
        self.title = "TodoList"
        self.navigationItem.rightBarButtonItem = addButtonBar
    }

    @objc private func addButtonTapped() {
        self.navigationController?.pushViewController(AddTodoViewController(), animated: true)
    }
}
