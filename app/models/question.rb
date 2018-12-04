class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  validates :text, :user, presence: true
  validates :text, length: { maximum: 200 }

end
