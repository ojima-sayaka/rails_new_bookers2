class Book < ApplicationRecord

  belongs_to :user
  # バリデーションの追加アプリ①の8章②21章
  # タイトル空欄なし・ボディ200文字以内

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  # validates :カラム, presence: true, length: { maximum: 50 }


end
