class Order < ActiveRecord::Base

  has_many :meals
  belongs_to :order_status
  belongs_to :user

  before_create :use_order_status
  #before_save :update_total_sum
  after_touch :update_total_sum

  scope :finalized, lambda { where(:order_status_id => 4) }
  scope :active, lambda { where(:order_status_id => [1,2,3] ) }
  scope :today, lambda {  where("DATE(created_at) = ?", Date.today)}


  NAME_REGEX = /\A[a-zA-Z0-9\s]+\Z/i


  validates :restaurantName, :presence => true,
  :length => {:within => 2..50},
  :format => NAME_REGEX


  def as_json(options= {})
    super(options.merge(include: [:order_status, :user, meals: {include: :user}]))
  end
  def totalPrice
    meals.collect {|m| m.valid? ? (m.price): (puts "blad") }.sum
  end


  private
  def use_order_status
    self.order_status_id = 1
  end
  def update_total_sum
    puts totalPrice
    self[:totalPrice] = totalPrice
    self.save
  end

end
