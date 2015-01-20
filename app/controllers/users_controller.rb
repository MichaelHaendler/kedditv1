class UsersController < ApplicationController
  def toy1
  end

  def toy2
  end

  def toy3
  end

  def index
  end

  def remember

  end

  def sign_up_helper

    logger.debug "start of sign up helper--------------------------------------"
    # p "params[:data] is: #{params[:data]}"

    #  #Client.where("first_name LIKE '%#{params[:first_name]}%'")
    # @val = User.where("user_name LIKE '%#{params[:data]}%'")
    
    # p "val length is: #{@val.length}"

    # #p @val.inspect

    # @val.to_json(:only => [:user_name])

    #@booleanVal = @val.length > 1

    @booleanVal = User.where("user_name LIKE '%#{params[:data]}%'").exists?

    p "booleanVal is: #{@booleanVal}"

    respond_to do |format|
      format.html

      format.json { render :json => { :status => 'Ok', :message => 'Received', exists: @booleanVal},
                    :status => 200
                  }
    end


    logger.debug "END of sign up helper----------------------------------------"

  end

#how to do the sqlite searches from within an action.
#http://guides.rubyonrails.org/active_record_querying.html
  def sign_up

    logger.debug "start of sign up--------------------------------------"

    #@results = User.select(:user_name).all

     @blah = 'Mike2'

     @results =  User.find_by user_name: "#{@blah}"

    logger.debug @results.inspect

    logger.debug "end of sign up----------------------------------------"
  end

  def sign_in
  end

  def sign_in_helper

    logger.debug "start of sign IN--------------------------------------"

    @returned_true = successfully_signed_in

    p "@returned_true is: #{@returned_true}"

    if @returned_true
      p "got here on '#{params[:session][:user_name]}'"
      redirect_to root_url #why the heck did THIS work, but render root_url didn't??
    else
      p "got to the ELSE part!! yay!"
      redirect_to new_user_url
    end

    logger.debug "end of sign IN--------------------------------------"

  end

  def create

   logger.debug "start of create--------------------------------------"

   if params[:user] != nil && params[:user][:name] != nil
    logger.debug "params[:user][:name] is #{params[:user][:name]}"
   end
   if params[:data] != nil
    logger.debug "data is #{params[:data].split(",")}"
   end
   
   logger.debug "end of create--------------------------------------"
    
    # if(params[:pass].nil?)
    #   render 'did not work'
    # else
    #   render 'did work!!! holy carp!!!'
    # end
    # @user = User.new(user_params)    
    # @user.save
    # Handle a successful save
    # if @user.save
    #   redirect_to root_url
    #   flash[:notice] = "it TOTALLY worked!!"
    #   redirect_to root
    # else
    #   flash[:alert] = "issue! did NOT work!!"
    #   redirect_to root
    # end
  end

  def new
   logger.debug "start of new--------------------------------------"
   logger.debug params[:data]
   logger.debug "end of new--------------------------------------"
   @user = User.new
  end

  def edit
  end

  def show
  end

  def update
  end


  def destroy
  end

  def default_page
  end

private #---------------------------------------------------------

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
