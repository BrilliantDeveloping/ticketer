class Ticket < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :assignee, class_name: 'User'
  
  scope :by_priority,   -> (priority)    {!priority.nil?    ? where(priority:    priority   ) : all}
  scope :by_user_id,    -> (user_id)     {!user_id.nil?     ? where(user_id:     user_id    ) : all}
  scope :by_assignee_id,-> (assignee_id) {!assignee_id.nil? ? where(assignee_id: assignee_id) : all}
  
  scope :by_status, -> (status) {
    if !status.nil?
      if status == 'open'
        where.not(status: 6)
      elsif status == 'closed'
        where(status: 6)
      else
        where(status: status)
      end
    else
      all
    end
  }
  
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