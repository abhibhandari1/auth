class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by({"email" => params["email"] })
        if @user
            if BCrypt::Password.new(@user["password"]) == params["password"]
                # cookies["monster"] = "Me like cookies"
                cookies["user_id"] = @user["id"]
                flash["notice"] = "Welcome"
                redirect_to "/companies"
            else
                flash["notice"] = "Nope"
                redirect_to "/sessions/new"
            end
        else
        redirect_to "/sessions/new"
        end
        def destroy
            session["user_id"] = nil
            flash["notice"] = "Goodbye"
            redirect_to "/sessions/new"
        end


    end

end
