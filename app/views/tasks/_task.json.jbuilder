json.extract! task, :id, :task_title, :due_date, :task_content, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
