module Node
  
  def to_param
    "#{url_title}"
  end
  
  def tag_tokens=(names)
    allTags = Array.new
    names.split(',').each do |name|
      allTags.push Tag.find_or_initialize_by_name(name.strip.downcase)
    end
    self.tags = allTags
  end
  
  def tag_tokens
    allTokens = Array.new
    self.tags.each do |t|
      allTokens.push t.name
    end
    return allTokens.join(',')
  end
  
  def default_attrs
    if self.views.nil?
      self.views = 0
    end
  end
  
end