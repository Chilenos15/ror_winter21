class Todo < ApplicationRecord

  validates :title, :desc, :complete, presence: true 
end