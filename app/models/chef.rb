class Chef < ApplicationRecord
    before_save {self.email = email.downcase}

    validates :chefname, presence: true, length: {maximum:30}
    validates :email,presence: true, length: {maximum:250},
            uniqueness: {case_sensitive: false}

    has_many :recipes
end