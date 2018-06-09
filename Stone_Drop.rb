#Drop object
#Author Jatti
class Stone_Drop

  attr_reader :dropChance
  attr_reader :item
  attr_reader :whatCanMine
  
  #whatCanMine - id of item with which you can mine this item
  #chance - on what chance it will drop
  #item - id of item which will drop
  def initialize(whatCanMine, chance, item, blockId)
    @whatCanMine = whatCanMine
    @dropChance = chance
    @item = item
    Block.get(blockId).addDrop(self)
  end
  
end