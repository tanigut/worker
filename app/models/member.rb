class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests
  has_many :reports
  has_many :rooms

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /[\p{katakana}　ー－]+/ }
  validates :first_name_kana, presence: true, format: { with: /[\p{katakana}　ー－]+/ }
  validates :company_name, presence: true, uniqueness: true


  def active_for_authentication?
    super && (self.is_deleted == true)
  end

  def full_name
    last_name + " " + first_name
  end

  def full_name_kana
    last_name_kana + " " + first_name_kana
  end

end
