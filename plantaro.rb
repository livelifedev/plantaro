require 'date'

class Plant
  attr_accessor :birthday, :age #just for testing
  
  def initialize(username, name, birthday = Date.new(1993, 04, 16))
    @owner = username
    @name = name
    @happiness = 20
    @birthday = birthday
    @age = (Date.today - @birthday).to_i
    @pest = false
    @messages = {
      :happy100 => "Your plant is vigorous!", 
      :happy75 => "Your plant is OK", 
      :happy50 => "Your plant is feeling standard...",
      :happy30 => "Your plant is feeling standard...",  
      :happy20 => "Mate! Your plant is sad and weak!",
      :water => "Your plant is glistening! sparkle sparkle.",
      :sun => "Your plant is getting a nice healthy tan.",
      :song => "Your plant is reacting to your angel-like voice.",
      :healed => "You saved your plant from ferocious pests, Hero!!",
      :dead => "Your plant died! Rest In Plant... Good plant, better person", 
      :overwater => "Too much water! This is not the Titanic!", 
      :oversun => "Too much sun! Your plant became a tomato", 
      :poison => "Too much pesticide! You plant looks sick!", 
      :noisy => "Don´t shout!",
      :infested => "Insects!",
      :positive => "Good decision!"
    }
    @last_action = []
  end

  def check_happiness
    if @happiness >= 100
      puts @messages[:happy100]
    elsif @happiness >= 75
      puts @messages[:happy75]
    elsif @happiness >= 50
      puts @messages[:happy50]
    elsif @happiness >= 30
      puts @messages[:happy30]
    elsif @happiness < 30
      puts @messages[:happy20]
    end
  end

  def water
    if @last_action[-1] == @last_action[-2] && @last_action.size > 1
      @happiness -= 10
      puts @messages[:overwater]
    else
      @happiness += 10
      puts @messages[:water]
    end
    @last_action.push "water"
  end

  def give_sun
      if @last_action[-1] == @last_action[-2] && @last_action.size > 1
        @happiness -= 10
        puts @messages[:oversun]
      else
        @happiness += 10
        puts @messages[:sun]
      end
    @last_action.push "give_sun"
  end

  def sing
    puts "What do you want to sing to your plant?"
    song = gets.chomp
    #shouting in upcase will reduce happiness
    if song == song.upcase 
      @happiness -= 10
      puts @messages[:noisy]
    else
      #length of song will add bonus points to happiness
      @happiness += 10 + song.length
      puts @messages[:song]
    end
    @last_action.push "sing"
  end

  def pest?
    #33% chance to get infested with bugs, previous action must not be spray
    #will not run if no other action has been taken first (newly created)
    if rand(3) == 1 && @last_action.last != "spray" && @last_action != []
      @pest = true
      @happiness -= 20
    end
    @pest
  end

  def spray
    if @pest
      #spraying plant while infested will return lost points
      @happiness += 20
      @pest = false
      puts @messages[:healed]
    else
      #if plant is not infested with bugs, spray will reduce happiness
      @happiness -= 10
      puts @messages[:poison]
    end
    @last_action.push "spray"
  end

  def death?
    @happiness <= 0
  end
end


puts "Give your little plantling a name?"
plant_name = gets.chomp
plantaro = Plant.new "John", plant_name

#puts plantaro.birthday
#puts plantaro.age

#program loop
loop do 
  if plantaro.death?
    puts "Your plant has withered away dues to poor plant-caring skills :("
    break
  end

  if plantaro.pest?
    puts "Oh no! Your plant is infested with bugs. Kill them quick!!" 
  end

  #options list
  puts "", "What would you like to do?"
  puts "-Water\n-Give sun\n-Sing\n-Spray pests\n-Check status\n-Quit", ""
  input = gets.chomp
  break if input == "quit"

  case input
    when "water"
      plantaro.water
    when "give sun"
      plantaro.give_sun
    when "sing"
      plantaro.sing
    when "spray"
      plantaro.spray
    when "check"
      plantaro.check_happiness
    else
      puts "Input invalid"
  end
  
end


