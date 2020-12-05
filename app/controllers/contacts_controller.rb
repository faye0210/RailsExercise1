class ContactsController < ApplicationController
  def new
    @contacts = Contact.new
  end
  def create
    @contacts = Contact.new(contact_params)
    if @contacts.save
      redirect_to new_contact_path, notice: "お問い合わせありがとうございます。"
    else
      render :new
    end
  end
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
