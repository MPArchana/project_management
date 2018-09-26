json.extract! task, :id, :project_id, :name, :status, :due_date, :label, :created_at, :updated_at
json.url task_url(task, format: :json)
