module TagsHelper
  def tag_css_class(curr, min, max)
    interval = (max - min + 1) / 3
    case curr
    when min..(min+interval-1)
      "tagLowFreq"
    when (min+interval)..(min+2*interval-1)
      "tagMediumFreq"
    when (min+2*interval)..max
      "tagHighFreq"
    end
  end
end
