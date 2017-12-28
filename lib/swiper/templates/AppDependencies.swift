//
//  AppDependencies.swift
//  <%= @project %>
//
//  Created by <%= @author %> on <%= @date %>.
//  Copyright © <%= @year %> <%= @author %>. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies: NSObject {

  // MARK: Instance Variables, Example 'homeWireframe'
  var <initial>Wireframe: <Initial>Wireframe

  override init() {
    super.init()
    configureDependencies()
  }

  func installRootViewControllerIntoWindow(_ window: UIWindow?) {
    <initial>Wireframe.present<initial>InterfaceFromWindow(window)
  }

  // MARK: Private
  private func configureDependencies() {
    let rootWireframe = RootWireframe()
    <initial>Wireframe = <Initial>Wireframe()
    <initial>Wireframe.rootWireframe = rootWireframe
  }

}
