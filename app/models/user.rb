class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy
# バリデーションuserについて！ name・２～２０まで introductyon 50まで
  # validates :カラム, presence: true, length: { maximum: 50 }

         has_one_attached :profile_image

        validates :introduction, length: { maximum: 50 }
        validates :name, uniqueness: true, length: { in: 2..20 }


        # validates :制限をかけたいカラム名,


   # length: { minimum: 1, maximum: 10 } ←文字数制限し方 minimum最小 maximum最大文字

        # attachment :profileimage


  # def get_profile_image(width, height)
  #   if profile_image.attached?
  #     profile_image.variant(resize_to_limit: [width, height]).processd
  #   else
  #     get_profile = Rails.root.join('app/assets/images/no_image.jpg')
  #     profile_image.attached(io:File.open(get_profile),filename: 'default-image.jpg', content_type: 'image/jpeg')
  #     'no_image.jpg'
  #   end
  # end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end


