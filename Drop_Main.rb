#This is drop script, when you try to break something
#To use it first set id to anything you want like this (in event on map):
#Block.get(yourId)
#Now you have to configurate all your drops here in dropConfiguration
#And to make it work in class Main after line begin add Drop_Main.new
#And to run it from event on map use Block.get(yourId).mine
#Author Jatti
class Drop_Main

  def initialize
    dropConfiguration()
  end  
  
  #To configurate drops you have to add new line like this:
  #addConfiguration(itemId1, chance, itemId2, blockId)
  #whatCanMine - id of tools with which you can drop this
  #chance - chance of drop
  #item - what item will drop
  #blockId - id which you previously set
  def dropConfiguration()
    #This adds (for me) drop which can be mined by brone shield, with chance 20%,
    #on block with id 1, and will drop potion
    addConfiguration(1, 20, 1, 1)
  end  
  
  def addConfiguration(whatCanMine, chance, item, blockId)
    Stone_Drop.new(whatCanMine, chance, item, blockId)
  end
  
end  