# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#format for podio json item retrived for each survey
#<Podio::Item:0x007ff6266760f0
  # @attributes=
  #  {:item_id=>339892745,
  #   :revision=>0,
  #   :app=>nil,
  #   :app_item_id=>109,
  #   :app_item_id_formatted=>"109",
  #   :external_id=>nil,
  #   :title=>"Clay Bahl",
  #   :fields=>
  #    [{"external_id"=>"title",
  #      "config"=>
  #       {"label"=>"Full Name",
  #        "mapping"=>nil,
  #        "settings"=>{"format"=>"plain", "size"=>"small"}},
  #      "field_id"=>96821566,
  #      "label"=>"Full Name",
  #      "values"=>[{"value"=>"Clay Bahl"}],
  #      "type"=>"text"},
  #     {"external_id"=>"your-email-address",
  #      "config"=>
  #       {"label"=>"Your Email Address",
  #        "mapping"=>nil,
  #        "settings"=>{"format"=>"plain", "size"=>"small"}},
  #      "field_id"=>96822076,
  #      "label"=>"Your Email Address",
  #      "values"=>[{"value"=>"cbahl2@illinois.edu"}],
  #      "type"=>"text"},
  #     {"external_id"=>"home-local-committee",
  #      "config"=>
  #       {"label"=>"Home Local Committee",
  #        "mapping"=>nil,
  #        "settings"=>
  #         {"multiple"=>false,
  #          "options"=>
  #           [{"status"=>"active",
  #             "text"=>"Arizona State",
  #             "id"=>1,
  #             "color"=>"DCEBD8"},
  #            {"status"=>"active",
  #             "text"=>"Appalachian",
  #             "id"=>2,
  #  This continues for 38 home commitees
  # "field_id"=>98638565,
  #      "label"=>"Home Local Committee",
  #      "values"=>
  #       [{"value"=>
  #          {"status"=>"active",
  #           "text"=>"Illinois",
  #           "id"=>17,
  #           "color"=>"DCEBD8"}}],
  # "field_id"=>96822079,
  #      "label"=>"Region of Internship",
  #      "values"=>
  #       [{"value"=>
  #          {"status"=>"active",
  #           "text"=>"Central & Eastern Europe",
  #           "id"=>3,
  #           "color"=>"DCEBD8"}}],


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

  			puts surveys.count

  			#binding.pry
  			surveys.each do |survey|

  				# puts i
  				# puts survey[0]
  				# puts survey[0][:fields][1]
  				# i+=1
  				#create all participants
  				#binding.pry
  				Participant.create(name: survey[:fields][0]["values"][0]["value"] , email: survey[:fields][1]["values"][0]["value"])

  				#create all internships

  				#create all committees

  				#create away_ratings

  				#create home_ratings

  				#create internship_committees
				end

  	rescue Podio::PodioError => ex
  		#something went wrong
  	end
