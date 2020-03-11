# app/controllers/home_controller.rb

class HomeController < ApplicationController
  def index
    @contact = Home.new(params[:home])
  end

  def create
    @contact = Home.new(params[:home])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Home.new
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
        # redirect_to contact_url
        redirect_to contact_url, alert: "Thank you for your message. We will get back to you soon!"
      else
        format.js   { flash.now[:error] = @message = "Message did not send." }
        redirect_to contact_url, alert: "Message did not send."
      end
    end
  end
end
