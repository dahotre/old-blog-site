require 'singleton'

class NodeFactory
  include Singleton
  @@programmings = nil
  @@ramblings = nil
  @@trendingNodes = nil

  def get_programmings
    @@programmings  ||= Programming.order("created_at DESC")
    return @@programmings
  end

  def reset_programmings
    @@programmings = nil
    return @@programmings
  end

  def get_ramblings
    @@ramblings  ||= Rambling.order("created_at DESC")
    return @@ramblings
  end

  def reset_ramblings
    @@ramblings = nil
    return @@ramblings
  end

  def top_programmings(count = 3)
    get_programmings.first(count)
  end

  def top_ramblings(count = 3)
    get_ramblings.first(count)
  end

  def get_programming_node(url_title)
    currNode = Programming.find_by_url_title(url_title) || not_found
    return currNode
  end

  def get_rambling_node(url_title)
    currNode = Rambling.find_by_url_title(url_title) || not_found
    return currNode
  end
  
  def get_trending_nodes
    @@trendingNodes ||= (get_ramblings + get_programmings).sort_by {|n|-n.views}
  end
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  def recommend(trendingNodes, user_id)
		uns = Array.new
    User.find(user_id).transactions.each {|t| uns << t.node}
    rec_nodes = trendingNodes - uns
    rec_node = rec_nodes.first if !rec_nodes.blank?
    return rec_node
  end

end