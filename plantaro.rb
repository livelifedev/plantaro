require 'date'

class Plant
  attr_accessor :birthday, :age #just for testing
  
  @@last_action = []
  @@messages = {
    :happy100 => "Your plant is vigorous!", 
    :happy75 => "Your plant is OK", 
    :happy50 => "Your plant is feeling standard...",
    :happy30 => "Your plant is feeling standard...",  
    :happy20 => "Mate! Your plant is sad and weak!", 
    :dead => "Your plant died! Rest In Plant... Good plant, better person", 
    :overwater => "Too much water! This is not the Titanic!", 
    :oversun => "Too much sun! Your plant became a tomato", 
    :poison => "Too much pestizide! Achoo!", 
    :noisy => "Don´t shout!",
    :infested => "Insects!",
    :positive => "Good decision!"
  }

  def initialize(username, name, birthday = Date.new(1993, 04, 16))
    @owner = username
    @name = name
    @happiness = 0
    @birthday = birthday
    @age = (Date.today - @birthday).to_i
    @pest = false
  end

  def check_happiness
    if @happiness >= 100
      puts @@messages[:happy100]
    elsif @happiness >= 75
      puts @@messages[:happy75]
    elsif @happiness >= 50
      puts @@messages[:happy50]
    elsif @happiness >= 30
      puts @@messages[:happy30]
    elsif @happiness < 30
      puts @@messages[:happy20]
    end
  end

  def water
    if @@last_action[-1] == @@last_action[-2]
      @happiness -= 10
      #then here we must display a sad message
    else
      @happiness += 10
      #then here we must display a good message
    end
    @@last_action.push "water"
  end

  def give_sun
      if @@last_action[-1] == @@last_action[-2]
        @happiness -= 10
        #then here we must display a sad message
      else
        @happiness += 10
        #then here we must display a good message
      end
    @@last_action.push "sun"
  end

  def sing
    puts "What do you want to sing to your plant?"
    song = gets.chomp
    if song == song.upcase #in case the owner shouts at the plant
      @happiness -= 10
      #then here we must display a sad message
    else
      @happiness += 10
      #then here we must display a good message
    end
    @@last_action.push "sing"
  end

  def pest?
    if rand(10).even?
      @pest = true
      @happiness -= 20
    end
    @pest
  end

  def spray
    if @pest
      happiness += 20
    else
      #if plant is not infested with bugs, spray will reduce happiness
      happiness -= 10
    end
  end
  @@last_action.push "spray"
end


puts "Give your little plantling a name?"
plant_name = gets.chomp
plantaro = Plant.new "John", plant_name

#puts plantaro.birthday
#puts plantaro.age

#program loop
loop do 
  #will run pest? method, 50% chance to have bugs
  puts "Oh no! Your plant is infested with bugs." if plantaro.pest?
  puts "", "What would you like to do?"
  puts "-Water\n-Give sun\n-Sing\n-Spray pests\n-Quit", ""
  input = gets.chomp

  break if input == "quit"

  case input
    when "water"
      plantaro.water
      puts "You watered plant"
    when "give sun"
      plantaro.give_sun
      puts "You sat plant in the sun"
    when "sing"
      plantaro.sing
      puts "You sang to plant"
    when "spray pests"
      #plantaro.spray
      puts "Sprayed pests"
    else
      puts "Input invalid"
  end

end


