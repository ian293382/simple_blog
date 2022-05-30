class Post < ApplicationRecord
  belongs_to :author
  has_many :elements

<<<<<<< HEAD

=======
>>>>>>> part3
  has_one_attached :header_image
end
