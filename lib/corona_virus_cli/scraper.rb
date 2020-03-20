class CoronaVirusCLI::Scraper

  @@doc = Nokogiri::HTML(open('https://www.worldometers.info/coronavirus/'))

  def self.doc
    @@doc
  end

  def self.get_virus
    all = self.get_totals.merge(self.get_active, self.get_closed)

    virus = CoronaVirusCLI::Virus.create('World', all)
  end

  def self.get_virus_per_country
    countries = @@doc.css('tbody')[0].css('tr')
    countries[0..19].each do |country|
      name = country.css('a').text.strip
      name = country.css('td')[0].text.strip if name.empty?
      total = country.css('td')[1].text.strip
      deaths = country.css('td')[3].text.strip
      recovered = country.css('td')[5].text.strip
      active = country.css('td')[6].text.strip

      CoronaVirusCLI::Country.new(name, total, deaths, recovered, active)
    end
  end

  def self.get_totals
    totals = @@doc.css('div.maincounter-number')
    {
      total: totals[0].text.strip,
      total_deaths: totals[1].text.strip,
      total_recovered: totals[2].text.strip,
    }
  end

  def self.get_active
    active = @@doc.css('div.panel_front')[0]

    {
      active: active.css('div.number-table-main').text.strip,
      active_mild: active.css('span.number-table')[0].text.strip,
      active_severe: active.css('span.number-table')[1].text.strip
    }
  end

  def self.get_closed
    closed = @@doc.css('div.panel_front')[1]

    {
      closed: closed.css('div.number-table-main').text.strip,
      closed_recovered: closed.css('span.number-table')[0].text.strip,
      closed_deaths: closed.css('span.number-table')[1].text.strip
    }
  end
end