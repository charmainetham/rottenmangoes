class Movie < ActiveRecord::Base
  has_many :reviews
  validates :title, presence: true
  validates :director,presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  #validates :poster_image_url, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_past

  scope :with_title, -> (title) { where("title LIKE ?", "%#{title}%") }
  scope :with_director, -> (director) { where("director like ?", "%#{director}%") }
  scope :under_x_min, -> (max_limit) { where("runtime_in_minutes < ?", max_limit) }
  scope :over_x_min, -> (min_limit) { where("runtime_in_minutes >= ?", min_limit) }
  scope :with_title_or_director, -> (term) { where("title LIKE ? OR director LIKE ?", "%#{term}%", "%#{term}%") }

  mount_uploader :avatar, AvatarUploader

  def review_average
    if reviews.size > 0
      reviews.sum(:rating_out_of_ten)/reviews.size
    else 
      reviews.sum(:rating_out_of_ten)
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end