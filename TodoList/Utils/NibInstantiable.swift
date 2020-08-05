//
//  NibInstantiable.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

public protocol NibInstantiable: NSObjectProtocol {
  associatedtype T
  static var defaultFileName: String { get }
  static func instantiateViewController(_ bundle: Bundle?) -> T
}

public extension NibInstantiable where Self: UIViewController {
  static var defaultFileName: String {
    return NSStringFromClass(Self.self).components(separatedBy: ".").last!
  }
  
  static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
    guard let vc = Self(nibName: defaultFileName, bundle: bundle) as? Self else {
      fatalError("Cannot instance view controller \(Self.self) from NiB")
    }
    return vc
  }
}
