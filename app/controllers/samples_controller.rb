class SamplesController < ApplicationController
  def index
    sample = Sample.last
    samples = Sample.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
    respond_to do |format|
      format.html { render }
      format.json do
        render :json => {
          sample:  sample,
          score:   "0",
          samples: {
            average: samples.inject(0.0) { |a, s| a += s.score } / samples.size,
            records: samples
          }
        }
      end
    end
  end

  def create
    sample = Sample.create! score: params[:score], notes: params[:notes]
    render :json => sample.to_json
  end
end
