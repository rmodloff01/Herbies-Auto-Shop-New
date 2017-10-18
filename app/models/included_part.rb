class IncludedPart < ApplicationRecord
  belongs_to :part
  belongs_to :inv
end
