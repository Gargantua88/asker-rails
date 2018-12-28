class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 200 }

  before_save :check_hashtags

  def check_hashtags
    all_hashtags = self.text.downcase.scan(/#\S+/)
    all_hashtags += self.answer.downcase.scan(/#\S+/) if self.answer.present?

    self.hashtags = all_hashtags.uniq.map do |tag|
      Hashtag.find_or_initialize_by(body: tag.delete(".,!?:;"))
    end
  end
end