class CLI
  attr_reader :virus

  def call
    @virus = Scraper.get_virus
    Scraper.get_virus_per_country

    puts "\n_____COVID-19 World Statistics_____\n"
    while true
      self.list_options
      puts "\nWhat would you like to see?"
      input = gets.strip.to_i
    end 
  end

  def list_options
    puts "1. World Total Stats"
    puts "2. World Active Cases Stats"
    puts "3. World Closed Cases Stats"
    puts "4. Stats per Country"
    puts "5. Exit"
  end
end