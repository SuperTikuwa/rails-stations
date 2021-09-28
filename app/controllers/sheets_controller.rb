class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
  end

  def show
    @sheets = Sheet.all
    if params[:date].present?
      @date = params[:date]
    else
      @date = Date.today.strftime("%Y-%m-%d")
      render :show, status: :bad_request
    end
  end
end
