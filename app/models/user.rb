class User < ActiveRecord::Base
  
  has_many :wikis, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable
  
  enum role: [:standard, :premium, :admin]
  
  after_initialize :init
  
  def init
    self.role ||= 0
  end
end
