class Virus
  attr_accessor :name, :cases, :deaths, :recovered, :active, :closed

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name, cases, deaths, recovered)
    self.name = name
    self.cases = cases
    self.deaths = deaths
    self.recovered = recovered

    self.save
  end

end