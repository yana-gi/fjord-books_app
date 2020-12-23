# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar
  has_many :following_relationships, class_name: 'Relationship',
                                     foreign_key: 'follower_id',
                                     dependent: :destroy
  has_many :follower_relationships, class_name: 'Relationship',
                                    foreign_key: 'followed_id',
                                    dependent: :destroy
  has_many :following, through: :following_relationships, source: :followed
  has_many :followers, through: :follower_relationships, source: :follower

  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
