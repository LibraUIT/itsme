class LoggedController < ApplicationController
  before_filter :authenticate_admin_user!
  respond_to :js, :html
  layout false
  skip_before_filter :verify_authenticity_token
  before_action :set_idol, only: [:edit, :update, :destroy]

  def index

  end

  def create
    @idol = Idol.create(idol_params)
    if @idol.save
      flash[:notice] = 'Idol was successsfully created !'
      redirect_to admin_idol_url
    else
      render 'create'
    end
  end

  def edit
  end

  def update
    @idol.update(idol_params)
    if @idol.save
      flash[:notice] = 'Idol was successsfully updated !'
      redirect_to admin_idol_url
    else
      render 'create'
    end
  end

  def destroy
    @idol.destroy
    render json: true
  end

  private

  def idol_params
    params.require(:idol).permit!
  end

  def set_idol
    @idol = Idol.find(params[:id])
  end
end
