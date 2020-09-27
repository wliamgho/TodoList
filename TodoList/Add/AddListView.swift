//
//  AddListView.swift
//  TodoList
//
//  Created by William on 27/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit
import TinyConstraints

final class AddListView: UIView {
  private lazy var contentView: UIView = {
    return UIView.create { (view) in
      view.backgroundColor = .white
    }
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    configureLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureLayout() {
    self.addSubview(contentView)

    contentView.edgesToSuperview()
  }
}
