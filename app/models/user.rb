class User < ApplicationRecord
	 validates_presence_of :weight, :height, :age
	 validates :age, numericality: { less_than_or_equal_to: 100}
	 validates :weight, numericality: { less_than_or_equal_to: 500}
	 validates :height, numericality: { less_than_or_equal_to: 300}
end
