# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  last_name      :string(255)
#  email          :string(255)
#  vacation_start :string(255)
#  vacation_end   :string(255)
#  zipcode        :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :vacation_end, :vacation_start, :zipcode

  before_save { |user| user.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_DATE = /\d{2}-\d{2}-\d{4}/
  VALID_ZIPCODE = /\d{5}/

  validates :first_name, 		presence: true, length: { maximum: 50 }
  validates :last_name, 		presence: true, length: { maximum: 50 }
  validates :email, 			  presence: true, length: { maximum: 50 },
  								format: { with: VALID_EMAIL_REGEX, 
                    message: "format invalid (name@example.com)" }, 
  								uniqueness: { case_sensitive: false, message: "already taken" }
  validates :vacation_start, 	presence: true, length: { is: 10 },
  								format: { with: VALID_DATE, message: "format invalid (MM-DD-YYYY)" }
  validates :vacation_end, 		presence: true, length: { is: 10 },
  								format: { with: VALID_DATE, message: "format invalid (MM-DD-YYYY)" }
  validates :zipcode,	 		presence: true, length: { is: 5 },
  								format: { with: VALID_ZIPCODE, message: "format invalid (12345)" }
end
