class ProgrammingsController < NodesController
  include NodesControllerActions
  before_filter :authorize, :except => [:index, :show]
  before_filter :initialize_vars
end