class TagsController < NodesController
  respond_to :html, :json
  def view
    @title = "Tags : " + params[:name]
    currTag = Tag.find_by_name(params[:name])
    @nodes = currTag.nodes
    @trendingNodes = NodeFactory.instance.get_trending_nodes
    @tag_heat = TagFactory.instance.get_tag_heat_map
  end

  def index
    @title = "Tags"
    @tags = TagFactory.instance.get_tags
    respond_with(@tags.map(&:attributes))
  end
end
