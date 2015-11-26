class PostsController < ApplicationController
  def blog_post_3
	render :locals => { :loud => !params[:quiet] }
	end 
	def blog_post_2
	render :locals => { :loud => !params[:quiet] }
  end
  def blog_post_1
	render :locals => { :loud => !params[:quiet] }
  end
  def billys_guest_post
	render :locals => { :loud => !params[:quiet] }
	end
end
