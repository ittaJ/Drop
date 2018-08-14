#Drop object
#Author Jatti
class Stone_Drop

  attr_reader :dropChance
  attr_reader :item
  attr_reader :whatCanMine
  attr_reader :isExp
  
  def initialize(whatCanMine, chance, isExp, item, blockId)
    @whatCanMine = whatCanMine
    @dropChance = chance
    @isExp = isExp
    @item = item
    Block.get(blockId).addDrop(self)
  end
  
end