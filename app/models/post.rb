class Post < ApplicationRecord
  acts_as_votable

  validates :user_id, presence: true

  has_attached_file :image, styles: { medium: "640x"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_presence_of :caption, :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :caption, presence: true, length: { maximum: 300 }
end
