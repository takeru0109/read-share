require 'test_helper'

class Admin::GenresControllerTest < ActionDispatch::IntegrationTest
  before_action :authenticate_admin!

	def index
        @genre = Genre.new
        @parents = Genre.all.order("id ASC")
    end
end
