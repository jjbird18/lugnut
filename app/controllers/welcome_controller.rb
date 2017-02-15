class WelcomeController < ApplicationController
  
  def homepage
  	@blogs = Blog.all
  end
  
end
