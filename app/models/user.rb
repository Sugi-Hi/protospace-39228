class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 値化
  validates :name , presence: true
  
  validates :profile , presence: true
  validates :occupation , presence: true
  validates :position , presence: true

  validates :email , presence: true
  validates :encrypted_password , presence: true
  # user⇒複数prototypes・comments
  has_many :prototypes
  has_many :comments
end
