class Invoice < ApplicationRecord
  belongs_to :cust
  belongs_to :emp
end
