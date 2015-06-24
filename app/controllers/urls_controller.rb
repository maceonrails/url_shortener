class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :redirect]

  def show
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to url_url(@url.short_url), notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def redirect
    if @url
      redirect_to @url.redirection(request), :status => :moved_permanently
    else
      redirect_to '/', notice: "there no any redirection for vanity #{params[:id]}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by_short_url(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:short_url, :original_url)
    end
end
