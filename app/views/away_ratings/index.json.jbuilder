json.array!(@away_ratings) do |away_rating|
  json.extract! away_rating, :id, :internship_id, :committee_id, :visa, :rating, :explanation, :experience_difficulties
  json.url away_rating_url(away_rating, format: :json)
end
