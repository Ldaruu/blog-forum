class ApplicationController < ActionController::Base
	add_flash_types :info, :error, :warning, :notice
	protect_from_forgery with: :exception
	include DeviseWhitelist
	include SetSource
	include CurrentUserConcern
	include DefaultPageContent
end