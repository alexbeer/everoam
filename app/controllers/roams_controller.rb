class RoamsController < ApplicationController
  before_action :set_roam, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  include S3PresignedPost

  def index
    @roams = Roam.all.paginate(:page => params[:page], :per_page => 12)
  end

  def show
  end

  def new
    @roam = current_user.roams.build
    @roam.images.build
    @s3_presigned_posts = (1..30).map { |i| s3_presigned_post('roams') }
  end

  def edit
    @s3_presigned_posts = (1..30).map { |i| s3_presigned_post('roams') }
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
      params.require(:roam).permit(:title, :location, images_attributes: [:id, :image_large_url, :image_medium_url, :image_thumb_url, :caption, :_destroy] )
    end
end
