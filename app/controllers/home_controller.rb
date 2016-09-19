class HomeController < ApplicationController

  def index
    @idols = Idol.approved.order('updated_at desc').page(params[:page]).per(30)
  end

  def loadmore
    @idols = Idol.approved.order('updated_at desc').page(params[:page]).per(30) if params[:page]
    render 'loadmore', layout: false
  end

  def register
    @vj = Vj.new
  end

  def create
    @vj = Vj.new(vj_params)
    if @vj.save
      redirect_to root_path
    else
    render 'register'
    end
  end

  private

  def vj_params
    params.require(:vj).permit(:name, :gender, :nick_name, :email, :identification, :home_address, :phone, :birthday, :facebook, :fan_number, :zalo, :cellphone_system, :cellphone_brand, :time_start_broadcast, :time_end_broadcast, :content, :network, :upload_speed, :light, :effective_date, :payment_method, :account_holder, :bank_name, :account_number, :bank_address)

  def policy
  end

end
