class CLI
  attr_reader :virus

  def call
    @virus = Scraper.get_virus
    Scraper.get_virus_per_country


    puts "\n_____COVID-19 World Statistics_____\n"
    self.list_options
    puts "Thank you!"
  end

  def list_options
    puts ""
    puts "1. World Total Stats"
    puts "2. World Active Cases Stats"
    puts "3. World Closed Cases Stats"
    puts "4. Stats per Country"
    puts "5. Exit"

    print "\nWhat would you like to see? "
    input = gets.strip.to_i
    if input.between?(1, 5)
      if input == 5
        return nil
      else
        self.option(input)
      end
    else
      puts "Invalid input"
      self.list_options
    end

    puts "\nWould you like to view something else?(Y/N)"
    input = gets.strip.downcase
    input == 'y' ? self.list_options : nil
  end

  def option(i)
    if i == 1
      self.display_totals
    elsif i == 2
      self.display_active
    elsif i == 3
      self.display_closed
    elsif i == 4
      self.display_country
    end
  end 

  def display_totals
    puts ''
    puts '--------------------------------'
    puts "Total Cases: #{self.virus.total}"
    puts "Total Deaths: #{self.virus.total_deaths}"
    puts "Total Recovered: #{self.virus.total_recovered}"
    puts '--------------------------------'
  end
  
  def display_active
    puts ''
    puts '--------------------------------'
    puts "World Active Cases: #{self.virus.active}"
    puts "  In Mild Condition: #{self.virus.active_mild}"
    puts "  In Severe Condition: #{self.virus.active_severe}"
    puts '--------------------------------'     
  end

  def display_closed
    puts ''
    puts '--------------------------------'     
    puts "World Closed Cases: #{self.virus.closed}"
    puts "  Recovered: #{self.virus.closed_recovered}"
    puts "  Deaths: #{self.virus.closed_deaths}"
    puts '--------------------------------'     
  end

  def display_country
    self.list_countries
    puts "\nWhich country would you like to view?"
    input = gets.strip.to_i

    if input.between?(1, self.virus.countries.length)
      country = Country.all[input - 1]
      puts ''
      puts '--------------------------------'     
      puts "#{country.name}:"
      puts "  Total Cases: #{country.total}"
      puts "  Total Deaths: #{country.deaths}"
      puts "  Total Recovered: #{country.recovered}"
      puts "  Active Cases: #{country.active}"
      puts '--------------------------------'     

      puts "\nWould you like to view another country?(Y/N)"
      repeat = gets.strip.downcase
      self.display_country if repeat == 'y'
    else
      puts "Invalid Input"
      self.display_country
    end
  end

  def list_countries
    puts ""
    self.virus.countries.each.with_index(1) do |country, i| 
      puts "#{i}. #{country.name}"
    end
  end 
end