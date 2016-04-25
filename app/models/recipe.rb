class Recipe < ActiveRecord::Base
  validates :title, presence: true



  belongs_to :user

  private


end
