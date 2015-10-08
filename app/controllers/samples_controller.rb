class SamplesController < ApplicationController
  before_filter :require_token

  def index
    sample  = Sample.where(study_token: params[:token]).last
    samples = Sample.where(study_token: params[:token], created_at: (Time.now.midnight - 1.day)..Time.now.midnight)

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
    sample = Sample.create! \
      study_token: params[:token],
      score: params[:score],
      notes: params[:notes]
    render :json => sample.to_json
  end

  private

  def require_token
    redirect_to "/studies" unless params[:token].present?
  end
end
