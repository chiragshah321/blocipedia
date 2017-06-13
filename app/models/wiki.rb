class Wiki < ActiveRecord::Base
  belongs_to :user, dependent: :destroy 
  has_many :collaborators
  has_many :collaborator_users, through: :collaborators, :source => :user 
  
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
   
end
