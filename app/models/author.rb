class Author < ActiveRecord::Base
    has_many :notes

    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: { case_sensitive: false}, length: { minimum:3, maximum:25 }

    VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/

    validates :email, presence: true, uniqueness: { case_sensitive: false}, length: { maximum:105 }, format: { with: VALID_EMAIL_REGEX }
end