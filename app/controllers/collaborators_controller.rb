class CollaboratorsController < ApplicationController

  def create

    @collaborator = Collaborator.new(params[:id])
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.where(email: params[:email]).take

    if @collaborator.save 
        flash[:notice] = "Your collaborator has been added to the wiki."
        redirect_to edit_wiki_path(@wiki)
    else
        flash[:error] = "Collaborator could not be added. Check spelling!"
        redirect_to edit_wiki_path(@wiki)
    end
  end


  def destroy

    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed from wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "Collaborator could not be removed."
      redirect_to edit_wiki_path(@wiki)
    end
  end
  
end
