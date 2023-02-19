class Public::CommunitiesController < ApplicationController
 def search
  @communities = @q.result
 end

 def search_results
 end

 private

 def set_q
    @q = User.ransack(params[:q])
 end
end
