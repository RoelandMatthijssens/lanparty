class Match < ActiveRecord::Base
	attr_accessible :round_id

	validates_presence_of :round

	belongs_to :round
	has_many :match_scores

	def next_match_after_win
		link = MatchWinLink.find_by_match_id( id )
		return Match.find( link.next_match_id )
	end

	def next_match_after_loss
		link = MatchLoseLink.find_by_match_id( id )
		return Match.find( link.next_match_id )
	end
end
