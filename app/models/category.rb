class Category < ApplicationRecord

has_many :posts
has_many :metas, as: :mettaable
end
