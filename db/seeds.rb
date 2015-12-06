# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



require 'pry'
Podio.setup(
  		:api_key    => 'aiesecdatabase',
  		:api_secret => 'zONm9h1SrW8EOh3TLp1SROjK519B2NamVev4oWW6WFe4dKnDg5NLAZTLaXsNdZ2x'
		)

		begin
  		Podio.client.authenticate_with_app('12658551', '775d01a88a884106a3a991c58bdd8e4d')

  			# Authentication was a success, now you can start making API calls.

  			#get all surveys
  			surveys=Podio::Item.find_all(12658551, :limit => 200)[0]

  			surveys.each do |survey|

  				#create all participants (unique)
  				participant=Participant.new(
  					name: survey[:fields][0]["values"][0]["value"], 
  					email: survey[:fields][1]["values"][0]["value"])
          participant.save
         
          particpant=Participant.find_by(email: survey[:fields][1]["values"][0]["value"])
        

  				#create all internships (not unique)
          if h = survey[:fields].find { |h| h['external_id'] == 'projectopportunity-name' }
             internshipname= h['values'][0]['value']
          else
            internshipname=""
          end

          if h=survey[:fields].find { |h| h['external_id'] == 'on-a-scale-of-1-10-how-likely-are-you-to-recommend-aies' }
            value= h["values"][0]["value"]["id"]
          else
            value= nil
          end

          internship=Internship.create(
  					product: survey[:fields].find { |h| h['external_id'] == 'internship-type' }["values"][0]["value"]["text"],
  					 name: internshipname,
  					start_date: survey[:fields].find { |h| h['external_id'] == 'dates-of-internship' }["values"][0]["start_date_utc"],
            end_date: survey[:fields].find { |h| h['external_id'] == 'dates-of-internship' }["values"][0]["end_date_utc"],
  					overall_rating: value,
  				  internship_rating: survey[:fields].find { |h| h['external_id'] == 'on-a-scale-of-1-10-how-would-you-rate-your-projectinter' }["values"][0]["value"]["id"],
  					participant_id: participant.id)

  				#create all home committees (unique)
  				home=Committee.new(
  				 	name: survey[:fields].find { |h| h['external_id'] == 'home-local-committee' }["values"][0]["value"]["text"],
  				 	region: "Western Europe & North America",
  					country: "USA"
  				)
          home.save
          home=Committee.find_by(name: survey[:fields].find { |h| h['external_id'] == 'home-local-committee' }["values"][0]["value"]["text"])

          #create all away committees (unique)
          if h=survey[:fields].find { |h| h['external_id'] == 'country-of-internship-2' }
            country= h["values"][0]["value"]
          else
            country= nil
          end

          away=Committee.new(
            name: survey[:fields].find { |h| h['external_id'] == 'your-hosting-local-committee' }["values"][0]["value"],
            region: survey[:fields].find { |h| h['external_id'] == 'region-of-internship' }["values"][0]["value"]["text"],
            country: country,
          )
          away.save
          away=Committee.find_by(name: survey[:fields].find { |h| h['external_id'] == 'your-hosting-local-committee' }["values"][0]["value"]["text"])

  				#create away_ratings (not unique)
  				AwayRating.create(
            internship: internship,
            committee: away,
            rating: survey[:fields].find { |h| h['external_id'] == 'on-a-scale-of-1-10-how-would-you-rate-your-hosting-loca' }["values"][0]["value"]["id"],
  				)

  				#create home_ratings (not unique)
          HomeRating.create(
            participant: participant,
            committee: home,
            rating: survey[:fields].find { |h| h['external_id'] == 'on-a-scale-from-1-10-how-would-you-rate-your-home-local' }["values"][0]["value"]["id"],
            prep_rating: survey[:fields].find { |h| h['external_id'] == 'on-a-scale-from-1-10-how-would-you-rate-the-cultural-pr' }["values"][0]["value"]["id"],
          )


  				#create internship_committees (not unique)
          InternshipCommittee.create(
            internship: internship,
            home_c: home,
            away_c: away,
          )
				end

  	rescue Podio::PodioError => ex
  		#something went wrong
  	end
