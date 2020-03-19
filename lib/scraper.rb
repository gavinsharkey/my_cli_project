class Scraper

  @@doc = Nokogiri::HTML(open('https://www.worldometers.info/coronavirus/'))

  def self.doc
    @@doc
  end

  def get_totals
    
  end
end