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
  #addDrop(whatCanMine, chance, isExp, item, blockId)
  #whatCanMine - id of tool with which you can drop this
  #chance - chance of drop
  #isExp - if true, it will drop exp and next field #item will be amount of dropped exp
  #item - what item will drop
  #blockId - id which you set by using Block.get(id)
  def dropConfiguration()
    #This adds (for me) drop which can be mined by brone shield, with chance 20%,
    #on block with id 1, and will drop potion
    addDrop(1, 40, false, 1, 1)
    addDrop(1, 40, true, 1, 1)
  end  
  
  def addDrop(whatCanMine, chance, isExp, item, blockId)
    Stone_Drop.new(whatCanMine, chance, isExp, item, blockId)
  end
  
end