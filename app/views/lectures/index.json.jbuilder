json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :content, :attachment, :course_id, :user_id
  json.url lecture_url(lecture, format: :json)
end
