class WikiPolicy < ApplicationPolicy
    
  def index?
    true
  end
  
  def create?
    update?
  end
  
  def edit?
    user.standard?
  end
  
  def delete?
    user.standard?
  end
  
end