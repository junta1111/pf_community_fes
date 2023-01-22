class Public::UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
 end

 def edit
 end

 def unsubscribe
 end

 def good
 end
end
