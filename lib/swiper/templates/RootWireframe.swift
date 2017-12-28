//
//  RootWireframe.swift
//  <%= @project %>
//
//  Created by <%= @author %> on <%= @date %>.
//  Copyright © <%= @year %> <%= @author %>. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe: NSObject {

  func showRootViewController(_ viewController: UIViewController, inWindow window: UIWindow?) {
    // set root view to wrap from navigation controller
    let navigationController = UINavigationController(rootViewController: viewController)

    // set window root
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()

    // let navigationController = window.rootViewController as! UINavigationController
    // navigationController.viewControllers = [viewController]
  }

}
