class Virus
  attr_accessor :name, :totals, :active, :closed

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name, totals, active, closed)
    self.name = name
    self.totals = totals
    self.active = active
    self.closed = closed

    self.save
  end

  def countries
    Country.all
  end

  def self.find_by_name(name)
    self.all.detect {|obj| obj.name == name}
  end

  def find_country_by_name(name)
    self.countries.detect {|country| country.name == name}
  end

end