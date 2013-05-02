# == Schema Information
# Schema version: 20120303191227
#
# Table name: deals
#
#  id         :integer         not null, primary key
#  dodTitle   :string(255)
#  dodImage   :string(255)
#  dodPrice   :string(255)
#  dodSave    :string(255)
#  buzzTitle  :string(255)
#  buzzImage  :string(255)
#  buzzPrice  :string(255)
#  buzzSave   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'hpricot'
require 'open-uri'

class Deal < ActiveRecord::Base
  @@deal = nil
  
  def self.lastDeal
    @@deal ||= Deal.last
  end
  
  def self.scrape
    logger.info "In scrapper.."
    @@deal = Deal.new
    begin
      dodPage = Hpricot(open('http://www.overstock.com/deal-of-the-day'))
      @@deal.dodTitle = dodPage.search("//div[@id='title-row']/h1").text.strip
      @@deal.dodPrice = dodPage.search("//div[@class='prod-holder']/h2/span[1]").text.strip
      @@deal.dodSave = dodPage.search("//div[@class='prod-holder']/h2/span[2]/span[2]").text.strip
      @@deal.dodImage = dodPage.search("//div[@class='prod-image']/a/img").attr('src')
      @@deal = parseBuzzBuy(@@deal)
      @@deal.save
      return @@deal
    end
  end

  def self.parseBuzzBuy(deal)
    # buzzPage = Hpricot(open('http://www.overstock.com/buzz-buy'))
    # deal.buzzTitle = buzzPage.search("//div[@id='prodMain_detail']//h1[@class='productName']").text.strip
    # deal.buzzPrice = buzzPage.search("//div[@id='pricing']//span[@itemprop='price']").text.strip
    # deal.buzzSave = parseBuzzSave().to_s

    # buzzImageElement1 = buzzPage.search("//div[@id='proImageHero']/img")
    #   buzzImageElement2 = buzzPage.search("//img[@id='activeImage']")
    #   if (!buzzImageElement1.empty?)
    #     deal.buzzImage = buzzImageElement1.attr('src')
    #   elsif(!buzzImageElement2.empty?)
    #     deal.buzzImage = buzzImageElement2.attr('src')
    #   end
    # rescue NoMethodError => nme
    #   logger.info deal.inspect
    #   logger.error "No method error.. Failure in scraping something.."
    #   logger.error nme.backtrace.join("\n")
    # ensure

    titlePattern = /\"name\":\"([a-zA-Z0-9\s\-\'\:\;\#\!\%\&\*\(\)]+)\",\"/
    titleFound = false

    baseUrlPattern = /baseImageUrl = \'(http[:\/\.a-zA-Z0-9\s]+)\'\,/
    baseUrlFound = false

    imgPattern = /\"imageMedium1\":\"([a-zA-Z0-9\/\s]+.jpg)\"/
    imgFound = false

    pricePattern = /\"price\":\"(\$[0-9]+\.*[0-9]*)\"/
    priceFound = false

    maxPattern = /tierRewardPercents\":(\[((\d)*,)+((\d)*)+\])+\}/
    maxFound = false

    # currPercPattern = /var cluboCurrentPrecent = parseInt\(\"(\d+)+\"\)\;/
    currPercPattern = /\"clubOPercent\":(\d)+/
    currFound = false

    maxPerc = 0
    currPerc = 0
    buzzImage = ""
    baseUrl = ""

    open('http://www.overstock.com/buzz-buy') do |file|

      file.each_line {|line|

        # Matcher for max club O offered
        maxMatcher = maxPattern.match(line)
        if maxMatcher && maxPerc == 0
          maxPerc = maxMatcher.captures[3].to_i
          logger.info "Max Perc: " + maxPerc.to_s
          maxFound = true
        end

        # Matcher for Current default club O offered
        currPercMatcher = currPercPattern.match(line)
        if currPercMatcher && currPerc == 0
          # currPerc = currPercMatcher.captures[0].to_i
          currPerc = currPercMatcher.captures[0].to_i
          logger.info "Curr perc: " + currPerc.to_s
          currFound = true
        end

        # Matcher for title
        titleMatcher = titlePattern.match(line)
        if titleMatcher && !titleFound
          deal.buzzTitle = titleMatcher.captures[0]
          logger.info "BUzz title: " + deal.buzzTitle
          titleFound = true
        end

          # Matcher for Baseurl of image
          baseUrlMatcher = baseUrlPattern.match(line)
          if baseUrlMatcher && !baseUrlFound
            baseUrl = baseUrlMatcher.captures[0]
            logger.info "baseUrl : " + baseUrl
            baseUrlFound = true
          end

        # Matcher for Image
        imgMatcher = imgPattern.match(line)
        if imgMatcher && !imgFound
          buzzImage = imgMatcher.captures[0]
          logger.info "buzz img : " + buzzImage
          imgFound = true
        end

        # Matcher for title
        priceMatcher = pricePattern.match(line)
        if priceMatcher && !priceFound
          deal.buzzPrice = priceMatcher.captures[0]
          logger.info "BUzz price : " + deal.buzzPrice
          priceFound = true
        end

        if titleFound && imgFound && priceFound && maxFound && currFound && baseUrlFound
          break
        end
      } 
    end
    logger.info "parser end"
    logger.info maxPerc
    deal.buzzImage = baseUrl + buzzImage
    deal.buzzSave = maxPerc + currPerc
    return deal
  end
end
