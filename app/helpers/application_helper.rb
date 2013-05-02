module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "dahotre.com"
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end

  def section_link_helper(section_type) 
    if (section_type == 'programmings') 
      section_title = 'programming'
    else
      section_title = section_type
    end
    link_to section_title.capitalize, { :controller => section_type }
  end

  def link_to_node_index(node)
    "/#{node.class.to_s.downcase.pluralize}/#{node.url_title}"
  end

  def link_to_wallpaper_index(node)
    "/#{node.class.to_s.downcase.pluralize}/#{node.id}"
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("/layouts/" + association.to_s + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
  end

  def fb_layout(size)
    if size == "medium"
      "button_count"
    elsif size == "tall"
      "box_count"
    end
  end

  def tweet_layout(size)
    if size == "medium"
      "horizontal"
    elsif size == "tall"
      "vertical"
    end
  end

  def getCurrentUrl(model)
    logger.info model.class.to_s
    case model.class.to_s
    when "Programming"
      return "http://www.dahotre.com" + link_to_node_index(model)
    when "Rambling"
      return "http://www.dahotre.com" + link_to_node_index(model)
    when "Wallpaper"
      return "http://www.dahotre.com" + link_to_wallpaper_index(model)
    end
  end
  
  def extractImage(html)
    imgPattern = /(\<img(.)*blogImage(.)*\>){1}/
    i=0
    html.each_line{|line|
      i = i + 1
      imgMatcher = imgPattern.match(line)
      if imgMatcher
        p "-----"
        logger.info imgMatcher.captures[0]
        return imgMatcher.captures[0].sub("blogImage", "thumbnail").sub("wide", "")
      end
    }
    return nil
  end
end
