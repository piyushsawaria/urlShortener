class Url < ActiveRecord::Base
	validates :original_url, presence: true
	before_create :create_short_url

	def create_short_url
		chars_arr = [('A'..'Z'),('a'..'z'),('0'..'9')].map(&:to_a).flatten
		self.short_url = chars_arr.sample(5).join
    self.short_url = chars_arr.sample(5).join until Url.find_by_short_url(self.short_url).nil?
	end
end
