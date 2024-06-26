class Admin::MapsController < ApplicationController

  def index
    @maps = Map.all
  end

  def show
    @map = Map.find(params[:id])
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to admin_maps_path, notice: 'マップが正常に作成されました。'
    else
      # エラーをログに出力
      logger.debug @map.errors.full_messages
      render :new
    end
  end

  private

  def map_params
    params.require(:map).permit(:body, :lat, :lng)
  end
end
