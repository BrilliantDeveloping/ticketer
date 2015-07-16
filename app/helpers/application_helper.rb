module ApplicationHelper
  
  def select(attr)
    @m.send(attr).map {|k,v| [v,k]}
  end
  
end
