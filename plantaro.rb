require 'date'

class Plant
  attr_accessor :birthday, :age #just for testing

  def initialize(username, name, birthday = Date.new(1993, 04, 16))
    @owner = username
    @name = name
    @happiness = 0
    @birthday = birthday
    @age = (Date.today - @birthday).to_i
    @pest = false
    @last_action = []
  end

  def pest?
    @pest = rand(10).even?
  end

  def water
    @last_action.push "water"
    if @last_action[-1] == @last_action[-2]
      @happiness -= 10
      #then here we must display a sad message
    else
      @happiness += 10
      #then here we must display a good message
    end
  end

  def give_sun
    @last_action.push "sun"
      if @last_action[-1] == @last_action[-2]
        @happiness -= 10
        #then here we must display a sad message
      else
        @happiness += 10
        #then here we must display a good message
      end
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
  end

  # def pesticide
  #   @last_action.push "pestizide"
  #   if @last_action[-1] == @last_action[-2]
  #     @happiness -= 10
  #     #then here we must display a sad message
  #   else
  #     @pests = false
  #     #then here we must display a good message
  #   end
  # end

end


puts "Give your little plantling a name?"
plant_name = gets.chomp
plantaro = Plant.new "John", plant_name

puts plantaro.birthday
puts plantaro.age

#program loop
loop do 
  puts "What would you like to do?"
  puts "-Water\n-Give sun\n-Sing\n-Spray pests\n-quit"
  input = gets.chomp

  break if input == "quit"
  puts "Your plant is infested" if plantaro.pest?

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

