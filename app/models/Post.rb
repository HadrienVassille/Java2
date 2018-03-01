class Post < ApplicationRecord

include Sluggable;

belongs_to :category, counter_cache: true
has_and_belongs_to_many :tags
has_many :metas, as: :mettaable

scope :published, -> { where(online: true)}


validates :title, presence: { message: ' ne doit pas être vide'}









end