require 'test_helper'

class Admin::ContactsControllerTest < ActionDispatch::IntegrationTest
  before_action :authenticate_admin!

 def index
	  @contacts = Contact.all
 end

  def show
    @contact = Contact.find(params[:id])
  end# test "the truth" do
  #   assert true
  # end
end