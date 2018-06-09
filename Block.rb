#Block object
#Author Jatti
class Block
  
  attr_reader :blockId
  attr_reader :drops

  def initialize(blockId)
    @blockId = blockId
    @drops = Array.new
    Drop_Utils.blocks << self
  end  
  
  def Block.get(blockId)
    
    if !Drop_Utils.blocks.empty?
      for i in 0..Drop_Utils.blocks.length
        if Drop_Utils.blocks.at(i).blockId == blockId
          return Drop_Utils.blocks.at(i)
        end
      end
    else 
      return Block.new(blockId)
    end
    return Block.new(blockId)
  end
  
  def addDrop(newDrop)
    @drops << newDrop
  end  
  
  def mine()
    if !@drops.empty?
      for i in 0..@drops.length-1
        if rand(100) < @drops.at(i).dropChance
          if $game_party.actors.at(0).armor4_id == @drops.at(i).whatCanMine
            $game_temp.message_text = "Ohh.. it looks like there is #{$data_items[@drops.at(i).item].name}!"
            $game_party.gain_item(@drops.at(i).item, 1)
          else
            $game_temp.message_text = "You can't mine it with this tool!"
          end
          Window_Message.new
          break
        end
      end
    end  
  end
  
end  