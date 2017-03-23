class Meal < ActiveRecord::Base
  belongs_to :order
  belongs_to :user

  before_save {order.touch}

  NAME_REGEX = /\A[a-zA-Z\s]+\Z/i
  PRICE_REGEX = /\A\d+(?:\.\d{0,2})?\z/


  validates :name,:presence => true,
  :length => {:maximum => 50},
  :format => NAME_REGEX

  validates :price,:presence => true,
  :numericality => {:greater_than => 0, :less_than => 999.99},
  :format => PRICE_REGEX

  def as_json(options = {})
    super(options.merge(include: :user))
  end

end
