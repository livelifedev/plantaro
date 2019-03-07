require 'date'
require 'rainbow'
require 'rainbow/refinement'
using Rainbow
require 'catpix'


class Plant
  attr_accessor :birthday, :age, :happiness #just for testing
  
  def initialize(username, name, birthday = Date.today)
    @owner = username
    @name = name
    @happiness = 20
    @birthday = birthday
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

  def age
    age = (Date.today - @birthday).to_i
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
    if rand(4) == 1 && @last_action[-1] != "spray" && @last_action != []
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
