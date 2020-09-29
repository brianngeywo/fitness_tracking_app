json.extract! workout, :id, :name, :length, :date, :created_at, :updated_at
json.url workout_url(workout, format: :json)
