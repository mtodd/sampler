class SamplesController < ApplicationController
  def index
    sample = Sample.last
    respond_to do |format|
      format.html { render }
      format.json do
        render :json => {sample: sample, score: "0"}
      end
    end
  end

  def create
    sample = Sample.create! score: params[:score], notes: params[:notes]
    render :json => sample.to_json
  end
end
