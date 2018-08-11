//
//  NSLayoutConstraintExtension.swift
//
//  Created by Mohammad Zulqurnain on 09/08/18.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
  @discardableResult func activate() -> NSLayoutConstraint {
    isActive = true
    return self
  }
}
