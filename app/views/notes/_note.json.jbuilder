json.extract! note, :id, :note_title, :text, :youtube, :user_id, :created_at, :updated_at
json.url note_url(note, format: :json)
