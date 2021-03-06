class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  
  has_many :posts, dependent: :destroy
  
  
  
  
  # 친구신청 관련 N:N
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  
  # 친구기능 관련 N:N
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  
  # 닉네임 넣지 않으면 DB에 저장X
  validates :nickname, presence: true
  
  # remove_friend는 User 클래스의 메소드이고, argument로 friend객체(=User객체)를 받는다.
  def remove_friend(friend)
    self.friends.destroy(friend)
  end
end
