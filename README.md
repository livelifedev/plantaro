Plantaro - Terminal app game.

The concept of this terminal game is to take care of and raise a virtual plant from seedling through growth. Similar to other 'pet' simulation games like Tamagotchi, the player is given options to interact with his/her plant which impact the health and happinness parameters of the plant affecting its growth. The plant is given a birth date when it is created by the user and the plant's age is tracked by days in real time from its creation. Depending on user actions, the plant can continuously thrive and grow or wither and die.


Pseudocode
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