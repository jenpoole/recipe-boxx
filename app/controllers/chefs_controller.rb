class ChefsController < ApplicationController
  
  # register new chef account
  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    
    if @chef.save
      flash[:success] = "Your account has been created successfully."
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  # edit chef profile
  def edit 
    @chef = Chef.find(params[:id])
  end
  
  def update 
    @chef = Chef.find(params[:id])
    
    if @chef.update(chef_params)
      flash[:success] = "Your profile has been updated successfully."
      redirect_to recipes_path #change redirect to chef show page later
    else
      render 'edit'
    end
  end
  
  
  private
  
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end
  
end