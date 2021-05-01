module Manager::GroupMessagesHelper
  def is_negative? score
    if score < -0.7
      true
    else
      false
    end  
  end  
  
end
