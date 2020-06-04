class RelationshipsController < ApplicationController

	def create
    	user = User.find(params[:follow_id])
    	following = current_user.follow(user)
    	if following.save
      		redirect_to request.referer
    	else
      		redirect_to request.referer
    	end
  	end

  	def destroy
    	user = User.find(params[:follow_id])
    	following = current_user.unfollow(user)
    	if following.destroy
     	 redirect_to request.referer
    	else
     	 redirect_to request.referer
    	end
  	end
end