class User < ActiveRecord::Base
  has_many :galleries

  validates :email, presence: true
end
