class SearchController < NodesController
  def index
    @trendingNodes = NodeFactory.instance.get_trending_nodes
  end
end
