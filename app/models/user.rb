# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = %r{^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|
                          ([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|
                          (\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$}i.freeze

  has_one :user_profile, dependent: :destroy, inverse_of: :user
  has_one :address, dependent: :destroy
  has_many :owners
  has_many :sitters

  validates :email, presence: true, uniqueness: { case_sensetive: false },
    format: { with: VALID_EMAIL_REGEX, multiline: true }
end
