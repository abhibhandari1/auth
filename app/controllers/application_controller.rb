class ApplicationController < ActionController::Base
    before_action :current_user

    def current_user
        puts"----- in the before action"
        @current_user = User.find_by({"id" => session["user_id"]})
    end
end
