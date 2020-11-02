class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests
  has_many :reports

  def active_for_authentication?
    super && (self.is_deleted == true)
  end

  def self.search(search,word)
    if search == "_match"
       @member = Member.where(is_deleted: true)
    elsif search == "perfect_match"
          @member = Member.where("last_name LIKE?","#{word}").or Member.where("first_name LIKE?","#{word}")
    elsif search == "partial_match"
          @member = Member.where("last_name LIKE?","%#{word}%").or Member.where("first_name LIKE?","%#{word}%")
    else
          @member = Member.all
    end
  end

end
