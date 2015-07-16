class Ticket < ActiveRecord::Base
  
  def self.priority 
    {
      1 => 'Low',
      2 => 'Medium',
      3 => 'High',
      4 => 'Critical' 
    }
  end
  
  def self.status 
    {
      1 => 'New',
      2 => 'Dispatched',
      3 => 'In Progress',
      4 => 'Escalate',
      5 => 'Waiting',
      6 => 'Complete'
    }
  end
  
end