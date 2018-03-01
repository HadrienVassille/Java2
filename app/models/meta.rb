class Meta < ApplicationRecord


belongs_to :mettaable, polymorphic: true
has_many :metas, as: :mettaable




end