class StudiesController < ApplicationController
  def index
    if params[:token].blank?
      redirect_to samples_url(:token => Study.generate_unique_token)
    end
  end
end
