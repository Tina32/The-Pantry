class Recipe < ActiveRecord::Base
  validates :title, presence: true

  before_save :default_values

  belongs_to :user

  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end
