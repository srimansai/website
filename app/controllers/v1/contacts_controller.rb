class V1::ContactsController < ApplicationController
  def index 
    @contacts = Contact.all 

    render json: @contacts, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)
    
    @contact.save
    render josn: @contact, status: :create
  end

  def destroy
    @contact = Contact.where(id: params[:id]).first
    if @contat.destroy
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
