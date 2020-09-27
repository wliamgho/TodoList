//
//  ViewExtension.swift
//  TodoList
//
//  Created by William on 27/09/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

extension UIView {
  @inline(__always) static func create<T>(applyAttributes: ((T) -> Void)? = nil) -> T where T: UIView {
    let uiComponent = T(frame: .zero)
    uiComponent.translatesAutoresizingMaskIntoConstraints = false
    applyAttributes?(uiComponent)
    return uiComponent
  }
}
