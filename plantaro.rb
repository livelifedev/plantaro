require 'date'
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'terminal-table/import'


class Plant
  attr_accessor :birthday, :age
  
  # messages = {:statuts => ["Your plant is vigorous!", "Your plant is OK", "Your plant is feeling standard...", "Mate! Your plant is sad and weak!", "Your plant died! Rest In Plant... Good plant, better person"], :command => {bad_decidion => ["Too much water! This is not the Titanic!", "Too much sun! Your plant became a tomato", "Too much pestizide! Achoo!", "Don´t shout!", "Insects!"], good decision => "Good decision!"}}
#good decision --> messages[2][2]; bad decisions --> messages[2][1][...]; status --> messages[1][...]
  def initialize(username, name, birthday = Date.new(1993, 04, 16))
    @owner = username
    @name = name
    @happiness = 0
    @birthday = birthday
    @age = (Date.today - @birthday).to_i
    @pest = false
    @last_action = []
  end

  def  water_plant #I want to water the plant. If I had watered it early, it´s less happy. If not, it´s happier.
    @last_action.push "water"
    if @last_action[-1] == @last_action[-2]
      @happiness -= 10
      #then here we must display a sad message
    else
      @happiness += 10
      puts @happiness
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

  # def insects
  #   if @pests == true
  #     @happiness -= 10
  #   else

      

  def pestizide
    @last_action.push "pestizide"
    if @last_action[-1] == @last_action[-2]
      @happiness -= 10
      #then here we must display a sad message
    else
      @pests = false
      #then here we must display a good message
    end
  end

end

# puts "Give your little plantling a name?"
# name = gets.chomp
# plantaro = Plant.new "John", name

# puts plantaro.birthday
# puts plantaro.age
# puts plantaro.sing
# puts plantaro.water_plant
# puts plantaro.give_sun


puts
option_table = table do
  self.headings = ['Option','Description']
  add_row ["sun", 'You will give sun to your plant so it can do photosynthesis']
  add_row :separator
  add_row ['sing', "You know singing to plants helps give them Carbon Dioxide?"]
  add_row :separator
  add_row ['pestizide', "You will kill the insects annoying your plant"]
  add_row :separator
  add_row ["water", "You will water your plant so it won´t dehidrate"]
end
puts option_table

