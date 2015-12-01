json.array!(@home_ratings) do |home_rating|
  json.extract! home_rating, :id, :participant_id, :committee_id, :rating, :explanation, :prep_rating, :prep_explanation, :prior_difficulties
  json.url home_rating_url(home_rating, format: :json)
end
