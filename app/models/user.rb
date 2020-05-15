class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

       # def jwt_payload
       #        super.merge({ 'foo' => 'bar' })
       # end

  has_many :users
end
