class RoamsController < ApplicationController
  before_action :set_roam, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @roams = Roam.all
  end

  def show
  end

  def new
    @roam = current_user.roams.build
  end

  def edit
  end

  def create
    @roam = current_user.roams.build(roam_params)
    if @roam.save
      redirect_to @roam
    else
      render action: 'new'
    end
  end

  def update
    if @roam.update(roam_params)
      redirect_to @roam
    else
      render action: 'edit'
    end
  end

  def destroy
    @roam.destroy
    redirect_to roams_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roam
      @roam = Roam.find(params[:id])
    end

    def correct_user
      @roam = current_user.roams.find_by(id: params[:id])
      redirect_to roams_path if @roam.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roam_params
      params.require(:roam).permit(:title, :location, :description, :descriptiontwo, :descriptionthree, :descriptionfour, :descriptionfive,
        :descriptionsix, :descriptionseven, :descriptioneight, :descriptionnine, :descriptionten,
       :image, :imagetwo, :imagethree, :imagefour, :imagefive, :imagesix, :imageseven, :imageeight, :imagenine, :imageten  )
    end
end
