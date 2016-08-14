class IdolsController < InheritedResources::Base

  private

    def idol_params
      params.require(:idol).permit(:name, :slug)
    end
end

