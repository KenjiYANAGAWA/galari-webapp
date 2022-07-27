class ExhibitsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :home ]
  
    def new
      @exhibit = Exhibit.new
    end

    def create
        @exhibit = Exhibit.new(exhibit_params)
        @exhibit.save
        redirect_to exhibit_path(@exhibit)
    end

    private

def exhibit_params
  params.require(:exhibit).permit(:title, :subtitle, :description, :explainer, :interactive, photos: [])
end
  end
  