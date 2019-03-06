$:.unshift File.dirname(__FILE__) + '/../lib'
require 'terminal-table/import'
require 'rainbow'
require 'rainbow/refinement'
using Rainbow
require "tty-font"
font = TTY::Font.new(:doom)
require 'catpix'
require_relative 'plantaro'

puts Rainbow(font.write("plantaro", letter_spacing: 4)).green
puts "Hello you, what is your name?"
user_name = gets.chomp
puts "#{user_name}, give your little plantling a name?"
plant_name = gets.chomp
plantaro = Plant.new user_name, plant_name
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
    when "cheat 100" #cheat code for testing
      plantaro.happiness = 100
    else
      puts "Input invalid"
  end
  
end