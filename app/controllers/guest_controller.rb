class GuestController < ApplicationController
  def new
    @idol = Idol.new
  end

  def create
    @idol = Idol.new(idol_params.merge(approved: false))
    respond_to do |format|
      if verify_recaptcha(model: @idol) && @idol.save
        format.html { redirect_to new_guest_path, notice: 'Idol was successfully submited. Approve or deny submission request by administrator.' }
        format.json { render :show, status: :created, location: @idol }
      else
        format.html { render :new }
        format.json { render json: @idol.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def idol_params
    params.require(:idol).permit!
  end
end