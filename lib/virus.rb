class Virus
  attr_accessor :name, :total, :total_deaths, :total_recovered, :active, :active_mild, :active_severe, :closed, :closed_deaths, :closed_recovered

  @@all = []
  # @@countries = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name)
    self.name = name
    self.save
  end

  def self.create(name, data)
    virus = Virus.new(name)

    data.each do |key, value|
      virus.send("#{key}=", value)
    end

    virus
  end
  # Potential refactor, still deciding
  # def self.create_country(name, total, deaths, recovered, active)
  #   country = Virus.new(name)
  #   country.total = total
  #   country.total_deaths = deaths
  #   country.total_recovered = recovered
  #   country.active = active

  #   @@countries << country
  #   country
  # end

  def self.find_by_name(name)
    self.all.detect {|obj| obj.name == name}
  end

end