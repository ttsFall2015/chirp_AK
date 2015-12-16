class RelationshipController < ApplicationController
  def create
      @relationship = current_user.relationship.build(friend_id: params[:friend_id])
        #.build is a RAILS method (not Ruby) creating it in memory for us to access
        #returns a new object of the collection type thathas been instantiated with attributes and linked to this object
        #when working with .build - include attributes (string, integer, etc.) that are to be built with
      if @relationship.save
        flash[:notice] = "Followed Succesfully"
        redirect_to profile_path(current_user.id)
          #all routes end with _path
      else
        flash[:notice] = "Unable to Follow"
        redirect_to root_path
      end
    end

    def destroy
      @relationship =
        current_user.relationships.find(params[:id])
      @relationship.destroy
        flash[:notice] = "No Longer Following"
      redirect_to profile_path(current_user.id)
    end




private

def relationship_params
  #rails convention > the params are called whatever the controller is called, in this instance "relationship"
  params.require(:relationship).permit(:user_id, :friend_id)
  #this stops data from getting to the model, except for those attributes which have been .permit above
end


end
