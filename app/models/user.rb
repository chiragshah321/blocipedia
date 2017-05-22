class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable
  
  enum role: [:standard, :premium, :admin]
  
  has_one :role
  
  after_initialize :init
  
  def init
    self.role ||= 0
  end
         
end
