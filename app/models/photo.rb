class Photo < ActiveRecord::Base

  attr_reader :dimensions
  attr_accessor :width
  attr_accessor :height
  has_attached_file :image, :styles => {:thumb => "100x100"}
  before_post_process :resize_images
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def image?
   image_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
  end

  private

  def resize_images
    return false unless image?
  end

end
