# beverages controller inherits app controller
class BeveragesController < ApplicationController
  def index
  	# loop through beverage class
    @beverages = Beverage.all 
  end

  def new
  	# make new and create at the same time
  	# creates new beverage
  	@beverage = Beverage.new
  end

  def create
  	# params is a strong parameter control per controller action which actions can be changed 
  	# binding this instance of beverage and setting it equal to the create method being performed on the beverage class and we are saying for this instance of beverage I am permitting the user to input these fields
  	@beverage = Beverage.create(params.require(:beverage).permit(:bev_type, :price, :quantity, :roast, :brew, :expiration_date))
  	# if the above process goes smoothly, save this instance of beverage and after you save it redirect to beverages_path - we got this from rake routes in the terminal and the prefix for #index
  	if @beverage.save
  		redirect_to beverages_path
  	else
  		# if the above is not successful rerender my "new form" (new view)
  		render 'new'
  	end
  end

end
