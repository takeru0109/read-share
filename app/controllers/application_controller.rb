class ApplicationController < ActionController::Base
    
    def set_parents
    @parents = Genre.where(ancestry: nil)
    end
    
end
