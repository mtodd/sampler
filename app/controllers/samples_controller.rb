class SamplesController < ApplicationController
  def create
    p [:samples, :create, params[:score].to_i]
    render :text => "ok"
  end
end
