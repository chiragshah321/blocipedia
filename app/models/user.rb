class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy
  has_many :collaborators
  has_many :collaborator_wikis, through: :collaborators, :source => :wiki
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable
  
  enum role: [:standard, :premium, :admin]
  
  after_initialize :init
  
  after_update :wikidowngrade
  
  def init
    self.role ||= 0
  end
  
  private
  
  def wikidowngrade
    return unless role_was == 'premium' && role == 'standard'
    
    wikis.each do |wiki|
      wiki.update_attribute(:private, nil) if wiki.private 
    end
  end
end




