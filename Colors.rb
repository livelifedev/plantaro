# Chartreuse green: f0f8ff
# White: ffffff


require "luminosity_contrast"
# colors Hex name: https://www.colorhexa.com/ffff00

#checking the title contrast (green and white) and "You saved #{@name} from ferocious pests, Hero!!"
green = LuminosityContrast::Color.new("008000")
white = LuminosityContrast::Color.new("ffffff")

puts green.ratio(white)
#5.137402780824574 > 4.5 so NICE!



#checking the contrast of "#{@name} is getting a nice healthy tan."
yellow = LuminosityContrast::Color.new("ffff00")
black = LuminosityContrast::Color.new("000000")

puts yellow.ratio(black)

#19.555999999999997 > 4.5 so NICE!



#checking the contrast of "#{@name} is glistening! sparkle sparkle."
aqua = LuminosityContrast::Color.new("00ffff")
black = LuminosityContrast::Color.new("000000")

puts aqua.ratio(black)

#16.748 > 4.5 so NICE!


#checking the contrast of "#{@name} is reacting to your angel-like voice."
silver = LuminosityContrast::Color.new("c0c0c0")
black = LuminosityContrast::Color.new("000000")

puts silver.ratio(black)

#11.542302514116262 > 4.5 so NICE!


#checking the contrast of "Oh no! Your plant is infested with bugs. Kill them quick!!"
indian_red = LuminosityContrast::Color.new("cd5c5c")
black = LuminosityContrast::Color.new("000000")

puts indian_red.ratio(black)

#5.2812269927768 > 4.5 so NICE!


#checking the contrast of "Too much sun! #{@name} became a tomato", "Too much water! #{@name} is not the Titanic!" and "Too much pesticide! #{@name} looks diseased!"
red = LuminosityContrast::Color.new("ff0000")
white = LuminosityContrast::Color.new("ffffff")

puts red.ratio(white)

#3.9984767707539985 > 3.5 good for big text but bad for normal text. Not enough time to change it. If dark red had been used it would have given a contrast ratio of 
# 10.010518239222488


