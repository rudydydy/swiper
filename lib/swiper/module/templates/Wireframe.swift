//
//  <%= @module %>Wireframe.swift
//  <%= @project %>
//
//  Created by <%= @author %> on <%= @date %>.
//  Copyright © <%= @year %> <%= @author %>. All rights reserved.
//

import Foundation
import UIKit

class <%= @module %>Wireframe {

  // MARK: Instance Variables
  var <%= @prefixed_module %>ViewController: <%= @module %>ViewController!
  var <%= @prefixed_module %>Presenter: <%= @module %>Presenter!

  // Optional: only if wireframe is root
  // var rootWireframe: RootWireframe!

  // MARK: Segue Wireframe


  // MARK: Init
  init() {
    let <%= @prefixed_module %>Interactor = <%= @module %>Interactor()
    <%= @prefixed_module %>Presenter = <%= @module %>Presenter()
    <%= @prefixed_module %>Presenter.interactor = <%= @prefixed_module %>Interactor
    <%= @prefixed_module %>Presenter.wireframe = self
    <%= @prefixed_module %>Interactor.output = <%= @prefixed_module %>Presenter
  }

  /*
  // Install as root view
  func present<%= @prefixed_module %>InterfaceFromWindow(_ window: UIWindow?) {
    <%= @prefixed_module %>ViewController = load<%= @module %>ViewControllerFromStoryboard()
    <%= @prefixed_module %>ViewController.presenter = <%= @prefixed_module %>Presenter
    <%= @prefixed_module %>Presenter.view = <%= @prefixed_module %>ViewController

    rootWireframe.showRootViewController(<%= @prefixed_module %>ViewController, inWindow: window)
  }
  */

  /*
  // Present as Modal
  func present<%= @prefixed_module %>Interface(_ controller: UIViewController) {
    <%= @prefixed_module %>ViewController = load<%= @module %>ViewControllerFromStoryboard()
    <%= @prefixed_module %>ViewController.presenter = <%= @prefixed_module %>Presenter
    <%= @prefixed_module %>Presenter.view = <%= @prefixed_module %>ViewController

    controller.present(<%= @prefixed_module %>ViewController, animated: true, completion: nil)
  }
  */

  /*
  // Push from another View
  func push<%= @module %>Interface(_ controller: UIViewController) {
    <%= @prefixed_module %>ViewController = load<%= @module %>ViewControllerFromStoryboard()
    <%= @prefixed_module %>ViewController.presenter = <%= @prefixed_module %>Presenter
    <%= @prefixed_module %>Presenter.view = <%= @prefixed_module %>ViewController

    guard let navigationController = controller.navigationController else { return }
    navigationController.pushViewController(<%= @prefixed_module %>ViewController, animated: true)
  }
  */

  // MARK: Private
  private func load<%= @module %>ViewControllerFromStoryboard() -> <%= @module %>ViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: <%= @module %>_VC) as! <%= @prefixed_module %>ViewController
    return viewController
  }
}
