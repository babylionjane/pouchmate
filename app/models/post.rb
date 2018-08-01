class Post < ActiveRecord::Base
    mount_uploader :img_url, ImageUploader
    belongs_to :user
    
    validates :title, :category, :open_date, :exp_date, presence: true
end
