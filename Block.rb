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
      for drop in 0..@drops.length-1
        _currentdrop = @drops.at(drop)
        if rand(100) < _currentdrop.dropChance
          if $game_party.actors.at(0).armor4_id == _currentdrop.whatCanMine
            if !_currentdrop.isExp
              $game_party.gain_item(_currentdrop.item, 1)
              _itemname = $data_items[_currentdrop.item].name
              #This message is configurable, just change it in those "" 
              #To display item's name add to your message #{_itemname}
              $game_temp.message_text = "Ohh.. it looks like there is #{_itemname}!"
            else
              _expamount = _currentdrop.item
              for actor in 0..$game_party.actors.length-1
                $game_party.actors[actor].exp += _expamount
              end
              _expamount = _currentdrop.item
              #This message is configurable, just change it in those ""
              #To display amount of exp add to your message #{_expamount}
              $game_temp.message_text = "Ohh.. it looks like there was #{_expamount} exp for all your party members!"
            end
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