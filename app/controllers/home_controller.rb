class HomeController < ApplicationController
  def index
    @idols = Idol.all.order('updated_at desc').page(params[:page]).per(30)
  end

  def loadmore
    @idols = Idol.all.order('updated_at desc').page(params[:page]).per(30)
    render 'loadmore', layout: false
  end
end
