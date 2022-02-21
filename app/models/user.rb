class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy

         has_one_attached :profile_image
        # attachment :profileimage


  def get_profile_image(width, height)
    if profile_image.attached?
      profile_image.variant(resize_to_limit: [width, height]).processed
    else
      get_profile = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attached(io:File.open(get_profile),filename: 'default-image.jpg', content_type: 'image/jpeg')
      'no_image.jpg'
    end
  end


end


