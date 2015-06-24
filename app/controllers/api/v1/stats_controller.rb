class API::V1::StatsController < ApplicationController
  before_action :set_url, only: [:index]

  def index
    render json: @url.to_json(include: { stats: { except: :url_id } }, methods: :redirected)
  end

  private
    def set_url
      @url = Url.find_by_short_url(params[:url_id])
    end
end
