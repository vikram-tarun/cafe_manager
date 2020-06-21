class User < ApplicationRecord
  validates :name, length: { minimum: 2 }
  validates :password, length: { minimum: 4 }
  has_secure_password
  has_many :orders

  def self.clerk_update(id, name, password)
    @user = find(id)
    unless name == ""
      @user.update(name: name)
    end
    unless password == ""
      @user.update(password: password)
    end
    @user.save!
  end
end
