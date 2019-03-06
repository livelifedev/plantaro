#Plantaro - Terminal app game.
The concept of this terminal game is to take care of and raise a virtual plant from seedling through growth. Similar to other 'pet' simulation games like Tamagotchi, the player is given options to interact with his/her plant which impact the health and happinness parameters of the plant affecting its growth. The plant is given a birth date when it is created by the user and the plant's age is tracked by days in real time from its creation. Depending on user actions, the plant can continuously thrive and grow or wither and die.


#GitHub Repo
  https://github.com/livelifedev/plantaro


#Required Packages
  The imagemagick library is required for Catpix/RMagick gem installation.
  Can be installed on mac with:
  - brew install imagemagick


#Required Gems
  Rainbow:
    https://github.com/sickill/rainbow

  Terminal-Table:
    https://github.com/tj/terminal-table

  Tty-font:
    https://github.com/piotrmurach/tty-font

  Catpix:
    https://github.com/pazdera/catpix

  Luminosity_contrast:
    https://github.com/devpuppy/luminosity_contrast

#Instructions for use
  *Install required gem files
  *Run the index.rb file in your CLI, which will start the game
  *Opening message will ask for user input, read the message and answer appropriately
  *The game will give you a lsit of commands which you can perform, along with descriptions
  *The game will end if your plant dies
  *You can also exit the game by typing quit in the input


############## Early Pseudocode #############
  #plant class - initialize a new plant for the user
    #properties to be initialised for each plant
      -owner_name
      -plant_name
      -birth_date #as day passes, plant ages and gains happinness
      -age
      -happiness
      -pests (true/false) 
          #randomly as days pass, plant will get infested with pests
          #pests will eat away at plants happiness if not pesticided

    #actions user can perform to plant (actions will affect plant happiness)
      -water_plant
      -give_sun
      -fertilize
      -sing/talk
      -pesticide
  #end
    ##created plant needs to be stored offline
    ##need method to get time difference of birthday and current time

  #messages displayed to user {
    happy_message: "your plant is happy"
    sad_message: ["too much water", "too much sun", "infested by pests"]
    growth: ["plant is growing well"]
  }
  
  #app startup message
  #receive input from user
  #create plant
#############################################


#Documentation
Screenshots of our development process and app can be found in the docs folder.

  User Stories:
  As George:
  As George, I want a little side distraction before class begins so that I can relieve some stress before a full day.

  As Brain:
  As Brian, I want to play games at work without getting caught by my boss.

  As Georgina:
  As Georgina, I want to take care of something so that I can express some motherly love.

  As Betty:
  As Betty, I have a lot of love to give but no one to give it to. I want an outlet for that.

 
+-------------+-------------------------------------------------------------+
| Option      | Description                                                 |
+-------------+-------------------------------------------------------------+
| Give sun    | You will give sun to your plant so it can do photosynthesis |
+-------------+-------------------------------------------------------------+
| Sing        | You know singing to plants helps give them Carbon Dioxide?  |
+-------------+-------------------------------------------------------------+
| Spray Pests | You will kill the insects annoying your plant               |
+-------------+-------------------------------------------------------------+
| Water       | You will water your plant so it won´t dehidrate             |
+-------------+-------------------------------------------------------------+
| Status      | You will check how your plant is feeling                    |
+-------------+-------------------------------------------------------------+
| Quit        | You will say goodbye to your plant and exit the game        |
+-------------+-------------------------------------------------------------+

Option Details:

  -	“Give sun”: 
  Utilized once or twice in a row it will add 10 points of happiness to user´s plant per time. However, if it´s used three times in a row, it will subtract 10 points of happiness that last time, thus netting 10.

  In the first case a drawing of the sun will appear, followed by the sentence "#{@name} is getting a nice healthy tan.". In the second case, a picture of the current plant will appear colored in red (to emulate sun burn) and a warning message will be displayed “Too much sun! #{@name} became a tomato".

  Warnings will be displayed in red letter on white background. Good messages wil be written in black on yellow background.

  -	“Water”:
  Utilized once or twice in a row it will add 10 points of happiness to user´s plant per time. However, if it´s used three times in a row, it will subtract 10 points of happiness that last time, thus netting 10.

  In the first case a drawing of a water drop will appear, followed by the sentence "#{@name} is glistening! sparkle sparkle.". In the second case, a picture of the current plant will appear colored in blue (to emulate dampness) and a warning message will be displayed "Too much water! #{@name} is not the Titanic!".

  Warnings will be displayed in red letter on white background. Good messages wil be written in black on aqua background.

  -	“Sing”:
  This will always add 10 happiness points plus one point per each letter the player inputs when asked "What do you want to sing to your plant?". Later, the program will print "#{@name} is reacting to your angel-like voice“, in black letters on silver background.

  The tricky part comes with the uppercase. If the user inputs only capitals, the program will understand they are shouting and display the "Don´t shout. #{@name} is scared!" message, in red on white background.

  Every time the user chooses Sing option, a picture of a musical note will appear.
  
  -	“Spray Pests”:
  This option is aimed to be chosen when the program tells the user "Oh no! Your plant is infested with bugs. Kill them quick!!", after which a picture of a bug will appear. Each turn the user refuses to use that option their plant will lose 20 happiness points. Once it is used, 20 points will be added and a picture of a red cross on a bug will show up.

  If the user sprays when it´s not necessary, 20 points will be subtracted and the program will display "Too much pesticide! #{@name} looks diseased!". Also, a picture of a poisoned plant will appear.

  -	“Status”:
  It will show the current happiness level of the plant. However, instead of through a rate, it will do so by printing a picture of a plant and a message, which size and which content respectively, will depend on its happiness.

  Furthermore, one of the following messages a message will appear:
  	"#{@name} is vigorous! Like a beanstalk", 
  	"#{@name}'s stem is looking thick and muscular", 
  	"#{@name} is chillin like a plant",
  	"#{@name} is feeling standard...",  
  	"#{@name} is looking like a scrawny twig!"

  -	“Quit”:

  The following message will be shown: "Your plant has lived great life at #{plantaro.age} days old.\n    Time to say goodbye :(".

- Final notes regarding WCAG 2.0 standards:
The luminosity_contrast gem is not necessary to play the game but it was used to check if the program complied with the WCAG 2.0 "AAA" standards.
