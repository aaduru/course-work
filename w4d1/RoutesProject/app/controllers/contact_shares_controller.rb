class ContactSharesController < ApplicationController
  def create
    @contactshare = ContactShare.create(contact_share_params)
    render :json => @contactshare
  end

  def destroy
    @contactshare = ContactShare.find(params[:id])
    @contactshare.destroy
    render :json => @contactshare
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end


end
