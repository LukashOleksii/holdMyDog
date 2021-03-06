# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = %r{^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|
                        ([A-Za-z0-9]+\.+)|
                        ([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|
                        (\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$}i

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :profile
  has_one  :address

  has_many :received_comments, class_name: Comment.name, foreign_key: :receiver_id
  has_many :authored_comments, class_name: Comment.name, foreign_key: :author_id

  validates :email,
            presence:   true,
            uniqueness: { case_sensetive: false },
            format:     { with: VALID_EMAIL_REGEX, multiline: true }

  accepts_nested_attributes_for :profile
end
