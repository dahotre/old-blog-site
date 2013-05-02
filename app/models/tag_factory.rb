require 'singleton'

class TagFactory
  include Singleton
  @@tags = nil
  @@tag_heat = nil

  def get_tags
    @@tags ||= Tag.all.sort{|a,b|b.nodes.size <=> a.nodes.size}
    # p "sizes............."
    # @@tags.each{|t|p "#{t.name} : #{t.nodes.size}"}
    # p "----------------"
    return @@tags
  end

  def get_tag_heat_map
    if (@@tag_heat.nil?)
      @@tags ||= Tag.all.sort{|a,b|b.nodes.size <=> a.nodes.size}
      @@tag_heat = Hash.new
      @@tags.first(20).each {|t|
        @@tag_heat[t] = t.nodes.size
      }
    end
    return @@tag_heat
  end

  def reset_tags
    @@tags = nil
  end

  def reset_tag_heat_map
    @@tag_heat = nil
  end

end