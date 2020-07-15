class V1::ContactsController < ApplicationController

  #  NB todo: error checking with render
  def index 
    # @contacts = Contact.all
    @contacts = current_user.contacts  # this is for when login setup 
    
    render :index, status: :ok
  end

  def create 
    # @contact = Contact.new(contact_params)  # no verification of current user in this line
    @contact = current_user.contacts.build(contact_params)

    @contact.save
    render :create, status: :created
  end

  def show 
     @contact = current_user.contacts.where(id: params[:id]).first
     render :show, status: :ok
  end


  def update 
    @contact = current_user.contacts.where(id: params[:id]).update(contact_params).first
    
    render :show, status: :ok
  end


  def destroy
    # @contact = Contact.where(id: params[:id]).first
    @contact = current_user.contacts.where(id: params[:id]).first
    if @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end


  private
  
  def contact_params 
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end
