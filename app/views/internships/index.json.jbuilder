json.array!(@internships) do |internship|
  json.extract! internship, :id, :type, :name, :start_date, :end_date, :key_learning, :overall_rating, :overall_expl, :internship_rating, :internship_expl, :participant_id
  json.url internship_url(internship, format: :json)
end
