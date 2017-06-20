class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:email])
    @collaborator = Collaborator.new(wiki: @wiki, user: @user)

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
