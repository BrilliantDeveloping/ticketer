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
  
  def two_part_number(value)
    one = value.split('.').first
    two = value.split('.').last
    (
      '<span class="two-part-number">'+
        '<span class="part1">'+one+'</span>.'+
        '<span class="part2">'+two+'</span>'+
      '</span>'
    ).html_safe
  end
  
  def bootstrap_modal(heading, body)
    ('<div class="modal fade" id="modal-display" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">'+heading+'</h4>
          </div>
          <div class="modal-body">'+
            body+
          '</div>
        </div>
      </div>
    </div>').html_safe
  end
    
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

end