class WikiPolicy < ApplicationPolicy
    
  def index?
    true
  end
  
  def create?
    update?
  end
  
  def edit?
    user.standard? || user.premium? || user.admin?
  end
  
  def delete?
    user.standard? || user.premium? || user.admin? 
  end
  
end