class Trip < ApplicationRecord

  belongs_to :user

  has_many :participants, :dependent => :destroy

  has_many :activities

end
