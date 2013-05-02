module NodesControllerActions
  @nodes = Array.new
  @node = nil
  @citations = Array.new
  @trendingNodes = Array.new
  @rec_node = nil

  def index
    populate_nodes
    @tag_heat = TagFactory.instance.get_tag_heat_map
  end

  def show
    populate_nodes
    t = Transaction.new :user_id => cookies[:userid].to_i, :remote_ip => request.remote_ip, :user_agent => request.user_agent, :rec => params[:REC]
    if self.class.to_s == "ProgrammingsController"
      @node = NodeFactory.instance.get_programming_node(params[:id])
      t.programming_id = @node.id
    elsif self.class.to_s == "RamblingsController"
      @node = NodeFactory.instance.get_rambling_node(params[:id])
      t.rambling_id = @node.id
    end
    if !@node.draft && !isBot?(request.user_agent) then
      logger.info "Not a bot : " + request.user_agent
      @node.views = @node.views + 1
    end
    @node.save
    @title = "#{@node.title} | #{@title}"
    @tag_heat = TagFactory.instance.get_tag_heat_map
    t.save unless @node.draft
  end

  def new
    @node = nil
    if self.class.to_s == "ProgrammingsController"
      @node = Programming.new
    elsif self.class.to_s == "RamblingsController"
      @node = Rambling.new
    end
    @node.citations.build
  end

  def create
    if self.class.to_s == "ProgrammingsController"
      @node = Programming.new(params[:programming])
    elsif self.class.to_s == "RamblingsController"
      @node = Rambling.new(params[:rambling])
    end
    if @node.save
      if self.class.to_s == "ProgrammingsController"
        NodeFactory.instance.reset_programmings
      elsif self.class.to_s == "RamblingsController"
        NodeFactory.instance.reset_ramblings
      end
      TagFactory.instance.reset_tags
      TagFactory.instance.reset_tag_heat_map
      redirect_to :action => "show", :id => @node
    else
      render :new
    end
  end

  def edit
    @node = nil
    if self.class.to_s == "ProgrammingsController"
      @node = NodeFactory.instance.get_programming_node(params[:id])
    elsif self.class.to_s == "RamblingsController"
      @node = NodeFactory.instance.get_rambling_node(params[:id])
    end
  end

  def update
    @node = nil
    type = nil
    if self.class.to_s == "ProgrammingsController"
      @node = NodeFactory.instance.get_programming_node(params[:id])
      type = :programming
    elsif self.class.to_s == "RamblingsController"
      @node = NodeFactory.instance.get_rambling_node(params[:id])
      type = :rambling
    end

    if @node.update_attributes(params[type])
      if self.class.to_s == "ProgrammingsController"
        NodeFactory.instance.reset_programmings
      elsif self.class.to_s == "RamblingsController"
        NodeFactory.instance.reset_ramblings
      end
      TagFactory.instance.reset_tags
      TagFactory.instance.reset_tag_heat_map
      flash[:notice] = "Successfully updated node."
      redirect_to @node
    else
      render :action => 'edit'
    end
  end


  protected
  def initialize_vars
    if self.class.to_s == "ProgrammingsController"
      @title = "Programming"
      @cell = "programmings"
    elsif self.class.to_s == "RamblingsController"
      @title = "Rambling"
      @cell = "ramblings"
    end
  end

  private
  def populate_nodes
    setCookies
    type = nil
    if self.class.to_s == "ProgrammingsController"
      @nodes = NodeFactory.instance.get_programmings
      type = "p"
    elsif self.class.to_s == "RamblingsController"
      @nodes = NodeFactory.instance.get_ramblings
      type = "r"
    end  
    @trendingNodes = NodeFactory.instance.get_trending_nodes
    @rec_node = NodeFactory.instance.recommend(@trendingNodes, cookies[:userid].to_i)
  end

end
