class Compo < ActiveRecord::Base

	include ComposHelper

	attr_accessible :date_time, :info, :slots, :match_id, :group_size, :game_id, :competition_type

	validates_presence_of :date_time
	validates_presence_of :slots
	validates_presence_of :group_size
	validates_presence_of :game
	validates_presence_of :competition_type

	belongs_to :game
	has_many :prices
	has_many :rounds

	def generate_matches
		@matchGenerator = MatchGenerator.new
	end

end
