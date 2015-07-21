module TicketsHelper
  
  def express_ticket?
    if action_name == 'express'
      'hidden'
    else
      'string'
    end
  end
  
end