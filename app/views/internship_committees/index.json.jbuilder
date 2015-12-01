json.array!(@internship_committees) do |internship_committee|
  json.extract! internship_committee, :id, :internship_id, :home_c_id, :away_c_id
  json.url internship_committee_url(internship_committee, format: :json)
end
