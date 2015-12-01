
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
  	render text: "Hello World" 
  end

  def init
  	Podio.setup(
  		:api_key    => 'aiesecdatabase',
  		:api_secret => 'zONm9h1SrW8EOh3TLp1SROjK519B2NamVev4oWW6WFe4dKnDg5NLAZTLaXsNdZ2x'
		)

		begin
  		Podio.client.authenticate_with_app('12658551', '775d01a88a884106a3a991c58bdd8e4d')

  			render text: "Podio Authenticated!"

  			@survey=Podio::Item.find_basic(339892745)

  			# Authentication was a success, now you can start making API calls.

		rescue Podio::PodioError => ex
  		# Something went wrong
		end
	end
end