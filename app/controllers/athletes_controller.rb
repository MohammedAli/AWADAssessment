class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end
  
  def star
    @athlete = Athlete.find(params[:id])

    if current_user
      if current_user.stars.exists?(:athlete_id => @athlete.id)
        redirect_to athletes_show_path(:id => @athlete), notice: 'You have already starred this athlete.'
      else
        @star = current_user.stars.create(:athlete_id => @athlete.id, :user_id => current_user.id)
        redirect_to athletes_show_path(:id => @athlete), notice: 'This athlete has been added to your STAR list.'
      end
    else
      redirect_to athletes_show_path(:id => @athlete), notice: 'Permission denied'
    end
  end
end