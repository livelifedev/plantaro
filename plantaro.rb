require 'date'
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'terminal-table/import'
require 'rainbow'
require 'rainbow/refinement'
using Rainbow
require "tty-font"
font = TTY::Font.new(:doom)
require 'catpix'


class Plant
  attr_accessor :birthday, :age #just for testing
  
  def initialize(username, name, birthday = Date.today)
    @owner = username
    @name = name
    @happiness = 20
    @birthday = birthday
    @age = (Date.today - @birthday).to_i
    @pest = false
    @messages = {
      :happy100 => "#{@name} is vigorous! Like a beanstalk", 
      :happy75 => "#{@name}'s stem is looking thick and muscular", 
      :happy50 => "#{@name} is chillin like a plant",
      :happy30 => "#{@name} is feeling standard...",  
      :happy20 => "#{@name} is looking like a scrawny twig!",
      :dead => "#{@name} died! Rest In Plant... Good plant, better person", 
      :water => "#{@name} is glistening! sparkle sparkle.",
      :sun => "#{@name} is getting a nice healthy tan.",
      :song => "#{@name} is reacting to your angel-like voice.",
      :healed => "You saved #{@name} from ferocious pests, Hero!!",
      :overwater => "Too much water! #{@name} is not the Titanic!", 
      :oversun => "Too much sun! #{@name} became a tomato", 
      :poison => "Too much pesticide! #{@name} looks diseased!", 
      :noisy => "Don´t shout. #{@name} is scared!"
    }
    @last_action = []
  end

  def print_pix(image)
    Catpix::print_image image,
      :limit_x => 0.4,
      :limit_y => 0,
      :center_x => true,
      :center_y => true,
      :bg => nil,
      :bg_fill => false,
      :resolution => 'auto'
  end

  def check_happiness
    puts "Plant status:"
    if @happiness >= 100
      print_pix "small/100_pxl.png"
      puts Rainbow(@messages[:happy100]).green.underline
    elsif @happiness >= 75
      print_pix "small/75_pxl.png"
      puts Rainbow(@messages[:happy75]).green.underline
    elsif @happiness >= 50
      print_pix "small/50_pxl.png"
      puts Rainbow(@messages[:happy50]).green.underline
    elsif @happiness >= 30
      print_pix "small/30_pxl.png"
      puts Rainbow(@messages[:happy30]).green.underline
    elsif @happiness < 30
      print_pix "small/20_pxl.png"
      puts Rainbow(@messages[:happy20]).green.underline
    end
    
    info = "Your plant's name is #{@name}, " +
    "this fella was born on #{@birthday}, " +
    "thanks to you #{@owner}:)"
    puts "", Rainbow(info).green.bright, ""
  end

  def water
    if @last_action[-1] == @last_action[-2] && @last_action[-1] == "water" 
      # ((@last_action[-2] == @last_action[-3] || @last_action[-1] == @last_action[-2]) && @last_action.size > 1) #when there have been carried out more than two actions, what takes into account the program is the previous two actions
      @happiness -= 10
      print_pix "small/overwater.png"
      puts Rainbow(@messages[:overwater]).red
    else
      @happiness += 10
      print_pix "small/actions/water.png"
      puts Rainbow(@messages[:water]).bg(:aqua)
    end
    @last_action.push "water"
  end

  def give_sun
    if @last_action[-1] == @last_action[-2] && @last_action[-1] == "give sun" 
    # ((@last_action[-2] == @last_action[-3] || @last_action[-1] == @last_action[-2]) && @last_action.size > 1)
      @happiness -= 10
      print_pix "small/burn.png"
      puts Rainbow(@messages[:oversun]).red
    else
      @happiness += 10
      print_pix "small/actions/sun.png"
      puts Rainbow(@messages[:sun]).bg(:yellow)
    end
    @last_action.push "give sun"
  end

  def sing
    puts "What do you want to sing to your plant?"
    song = gets.chomp
    print_pix "small/actions/sing.png"
    #shouting in upcase will reduce happiness
    if song == song.upcase 
      @happiness -= 10
      puts Rainbow(@messages[:noisy]).red
    else
      #length of song will add bonus points to happiness
      @happiness += 10 + song.length
      puts Rainbow(@messages[:song]).bg(:silver)
    end
    @last_action.push "sing"
  end

  def pest?
    #chance modifier for bug infestation, previous action must not be spray
    #will not run if no other action has been taken first (newly created)
    if rand(3) == 0 && @last_action[-1] != "spray" && @last_action != []
      @pest = true
      print_pix "small/actions/pest.png"
      @happiness -= 20
    end
    @pest
  end

  def spray
    if @pest
      #spraying plant while infested will return lost points
      @happiness += 20
      print_pix "small/actions/pestkill.png"
      @pest = false
      puts Rainbow(@messages[:healed]).bg(:green)
    else
      #if plant is not infested with bugs, spray will reduce happiness
      @happiness -= 10
      print_pix "small/poison.png"
      puts Rainbow(@messages[:poison]).red
    end
    @last_action.push "spray"
  end

  def death?
    if @happiness <= 0
      print_pix "small/0_pxl.png" 
      return true
    else
      return false
    end
  end
end

puts Rainbow(font.write("plantaro", letter_spacing: 4)).green
puts "Give your little plantling a name?"
plant_name = gets.chomp
plantaro = Plant.new "John", plant_name
plantaro.print_pix "small/20_pxl.png"
  
#program loop
loop do 
  if plantaro.death?
    puts Rainbow("Your plant has withered away dues to poor plant-caring skills :(").black
    break
  end

  if plantaro.pest?
    puts Rainbow("Oh no! Your plant is infested with bugs. Kill them quick!!").bg(:indianred)
  end

  #options list
  puts "What would you like to do?"

  puts
  option_table = table do
    self.headings = ['Option','Description']
    add_row ["Give sun", 'You will give sun to your plant so it can do photosynthesis']
    add_row :separator
    add_row ['Sing', "You know singing to plants helps give them Carbon Dioxide?"]
    add_row :separator
    add_row ['Spray Pests', "You will kill the insects annoying your plant"]
    add_row :separator
    add_row ["Water", "You will water your plant so it won´t dehidrate"]
    add_row :separator
    add_row ["Status", "You will check how your plant is feeling"]
    add_row :separator
    add_row ["Quit", "You will say goodbye to your plant and exit the game"]
  end
  puts option_table, ""

  input = gets.chomp
  if input == "quit"
    puts "", Rainbow("Your plant has lived great life at #{plantaro.age} days old.\n
    Time to say goodbye :(").black
    break
  end

  case input.downcase
    when "water"
      plantaro.water
    when "give sun"
      plantaro.give_sun
    when "sing"
      plantaro.sing
    when "spray pests"
      plantaro.spray
    when "status"
      plantaro.check_happiness
    else
      puts "Input invalid"
  end
  
end
  