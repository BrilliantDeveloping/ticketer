module ApplicationHelper
  
  def select(attr)
    @m.send(attr).map {|k,v| [v,k]}
  end
  
  def labels(type, model)
    @m.send(type).select do |k,v|
      h = ('<span class="label '+type+k.to_s+'">'+v+'</span>')
      return h.html_safe if k == model.send(type)
    end
  end
  
end