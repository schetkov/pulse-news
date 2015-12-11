class Page < ActiveRecord::Base
  
  #relations
  
  has_many :pages_admin_users
  has_many :admin_users, through: :pages_admin_users
  
  # paperclip attachment for header image
  
  has_attached_file :thumb,
    styles: { medium: "300x300>", large: "800x600>" }
  validates_attachment_content_type :thumb, content_type: /\Aimage\/.*\Z/  
  
  
  extend FriendlyId
  friendly_id :header, use: :slugged
  acts_as_taggable
  
  #friendly_id translation & authors
  
  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end
  
  def authors
    self.admin_users.map { |admin| admin.name }
  end
  
end