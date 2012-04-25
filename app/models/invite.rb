class Invite < ActiveRecord::Base
  belongs_to :household

  before_create :create_token
  def create_token
    hex = Digest::SHA1.hexdigest("#{Time.now.to_i}-#{sent_to}")
    self.token = hex.to_i(16).to_s(36)
  end

  def to_param
    token
  end
end
