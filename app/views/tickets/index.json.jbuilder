json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :subject, :content, :status, :priority, :user_id, :assignee_id
  json.url ticket_url(ticket, format: :json)
end
