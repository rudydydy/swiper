//
//  <%= @module %>ViewController.swift
//  <%= @project %>
//
//  Created by <%= @author %> on <%= @date %>.
//  Copyright © <%= @year %> <%= @author %>. All rights reserved.
//

import UIKit

class <%= @module %>ViewController: UIViewController {

  // MARK: Instance Variables
  var presenter: <%= @module %>ModuleInterface!

  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Button event handlers

}

// MARK: - <%= @module %>ViewInterface 
extension <%= @module %>ViewController: <%= @module %>ViewInterface {

}
