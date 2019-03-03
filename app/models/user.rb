class User < ApplicationRecord
  validates :name, presence: true,
             length:{ maximum: 15 }
  validates :email, presence: true,
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true,
             format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i},
             length:{ minimum: 8, maximum: 32 }
  validates :password_confirmation, presence: true,
             format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i},
             length:{ minimum: 8, maximum: 32 }

  has_secure_password

  has_many :topics
  has_many :favorites, dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'

  has_many :comments, dependent: :destroy
end
