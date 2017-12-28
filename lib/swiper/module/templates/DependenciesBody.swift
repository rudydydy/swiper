// ------------------------------------------------------------------
// begin <%= @module %> module
* * * * * * * * * * * * * * * * * * * * * * * * * * * *
*                                                     *
*                 |-----------|                       *
*                 | Router    |                       *
*                 |-----------|                       *
*                       ^                             *
*                       |                             *
*                       v                             *
* |-------|       |-----------|       |------------|  *
* | View  | <---> | Presenter | <---> | Interactor |  *
* |-------|       |-----------|       |------------|  *
*                                           ^         *
*                                           |         *
*                                           v         *
*                                     |------------|  *
*                                     | Entity     |  *
*                                     |------------|  *
*                                                     *
* * * * * * * * * * * * * * * * * * * * * * * * * * * *

V (View)            -> User Interface
---------------------------------------------------------------------
* displays what it is told to by the Presenter and
  relays user input back to the Presenter.

I (Interactor)      -> Fetch Remote/Local data to Entity
---------------------------------------------------------------------
* contains the business logic as specified by a use case.

P (Presenter)       -> Event Handler
---------------------------------------------------------------------
* contains view logic for preparing content for display
  (as received from the Interactor) and for reacting to
  user inputs (by requesting new data from the Interactor).

E (Entity)          -> Application Model
---------------------------------------------------------------------
* contains basic model objects used by the Interactor.

R (Route/Wireframe) -> Navigation between View
---------------------------------------------------------------------
* contains navigation logic for describing which screens
  are shown in which order.

// instantiate classes
var <%= @prefixed_module %>Wireframe: <%= @prefixed_module %>Wireframe      = <%= @prefixed_module %>Wireframe()
var <%= @prefixed_module %>Presenter: <%= @prefixed_module %>Presenter      = <%= @prefixed_module %>Presenter()
var <%= @prefixed_module %>DataManager: <%= @prefixed_module %>DataManager  = <%= @prefixed_module %>DataManager()
var <%= @prefixed_module %>Interactor: <%= @prefixed_module %>Interactor    = <%= @prefixed_module %>Interactor()

// presenter <-> wireframe
<%= @prefixed_module %>Presenter.wireframe = <%= @prefixed_module %>Wireframe
<%= @prefixed_module %>Wireframe.presenter = <%= @prefixed_module %>Presenter

// presenter <-> interactor
<%= @prefixed_module %>Presenter.interactor = <%= @prefixed_module %>Interactor
<%= @prefixed_module %>Interactor.presenter = <%= @prefixed_module %>Presenter

// interactor -> data_manager
<%= @prefixed_module %>Interactor.dataManager = <%= @prefixed_module %>DataManager

// data_manager -> data_store
// *** connect datastore

// connect wireframes
<%= @prefixed_module %>Wireframe.rootWireframe = rootWireframe
// *** connect more wireframes

// configure delegate
// *** add delegate here if needed

// end <%= @module %> module
// ------------------------------------------------------------------
