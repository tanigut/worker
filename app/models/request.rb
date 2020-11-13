class Request < ApplicationRecord

  belongs_to :event_genre
  belongs_to :member
  has_one :report

  enum approval_status: { responding: 0, approval: 1, denial: 2, finish: 3 }


  validates :chief_name, :body, :title, :start_day, :finish_day, presence: true
  validates :people, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 20,
      allow_blank: true
    }

  #日付のバリデーション
  #if :start_day && :finish_day.nil?
    #validates :start_day, :finish_day, presence: true
  #else
    #validate :start_finish_check
    #def start_finish_check
        #errors.add(:finish_day, "の日付を正しく記入してください。") unless
        #self.start_day < self.finish_day
    #end
  #end

  #def start_finish_check
    #unless :start_day && :finish_day.nil?
      #if self.start_day > self.finish_day
         #errors.add(:finish_day, "の日付を正しく記入してください。")
      #end
    #end
  #end


  #検索機能
  def self.search(search)
    if search == "all_match"
       @request = Request.all
    elsif search == "responding_match"
       @request = Request.where(approval_status: 0)
    elsif search == "approval_match"
       @request = Request.where(approval_status: 1)
    elsif search == "denial_match"
       @request = Request.where(approval_status: 2)
    elsif search == "finish_match"
       @request = Request.where(approval_status: 3)
    end
  end

end
