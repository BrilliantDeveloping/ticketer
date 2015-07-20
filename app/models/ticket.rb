class Ticket < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :assignee, class_name: 'User'
  has_many :comments, as: :commentable
  
  before_create :ticket_number
  before_save :fill_in_subject
  
  # Ticket states
  def self.open
    where.not(status: 6)
  end
  
  def self.closed
    where(status: 6)
  end
  
  def self.severe
    where("priority = 3 OR priority = 4")
  end
  
  def self.assigned(user)
    where(assignee_id: user)
  end

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
      4 => 'Escalated',
      5 => 'Waiting',
      6 => 'Complete'
    }
  end
  
  # Ticket numbers
  def ticket_number
    d = Time.now.strftime('%m%d%y')
    if Ticket.count == 0
      n = 1
    else
      t = Ticket.last.number
      t[1..6] != d ? n = 1 : n = t[8..10].to_i + 1
    end
    self.number = 'T'+d+'.'+sprintf('%03d', n)
  end
  
  def fill_in_subject
    if self.subject.blank?
      self.subject = self.content.truncate_words(15)
    end
  end
  
  # Scopes
  scope :by_assignee_id, -> (assignee_id) {
    !assignee_id.nil? ? where(
      assignee_id: assignee_id
      ) : all
    }
  
  scope :by_user_id, -> (user_id) {
    !user_id.nil? ? where(
      user_id: user_id
      ) : all
    }
  
  scope :by_priority, -> (priority) {
    if !priority.nil? 
      if priority == 'severe'
        where("priority = 3 OR priority = 4")
      else
        where(priority: priority)
      end
    else
      all
    end
    }
  
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
  
end