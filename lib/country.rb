class Country
  attr_accessor :name, :total, :deaths, :recovered, :active

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name, total, deaths, recovered, active)
    self.name = name
    self.total = total
    self.deaths = deaths
    self.recovered = recovered
    self.active = active

    self.save
  end
end