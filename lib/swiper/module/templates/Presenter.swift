//
//  <%= @module %>Presenter.swift
//  <%= @project %>
//
//  Created by <%= @author %> on <%= @date %>.
//  Copyright © <%= @year %> <%= @author %>. All rights reserved.
//

import Foundation

class <%= @module %>Presenter: <%= @module %>ModuleInterface {

  weak var view: <%= @module %>ViewInterface!

  var interactor: <%= @module %>InteractorInput!
  var wireframe: <%= @module %>Wireframe!

  // MARK: - <%= @module %>ModuleInterface

}

// MARK: - <%= @module %>InteractorOutput
extension  <%= @module %>Presenter: <%= @module %>InteractorOutput {

}
