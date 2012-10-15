module ComposHelper

	class MatchGenerator

		def initialize ( competition )
			@competition = competition
		end

		def generate
			# We do not need any more information to greato all the rounds, so make them
			# first, then create the matches for each round. And finally assign each team
			# to matches in the first round
			make_rounds
			make_matches
			update_round 1
		end

		def make_rounds
			raise 'Not implemented'
		end

		def make_matches
			raise 'Not implemented'
		end

	end

	class RoundRobin < MatchGenerator
		attr :rounds

		def nrOfRounds
			return 2
		end

		def nr_of_games
			n = 0
			@competition.slots.times do |m| n += m + 1 end
			return n
		end

		def make_rounds
			round1 = Round.new :compo_id => @competition, :level => 1
			round1.save
			round2 = Round.new :compo_id => @competition, :level => 2
			round2.save

			@rounds = { 1 => round1, 2 => round2 }
			return Array[ round1, round2 ]
		end

		def make_matches
			finalRound = @rounds[2]
			firstRound = @rounds[1]

			scoreMatch = Match.new :round_id => finalRound.id
			scoreMatch.save

			nr_of_games.times do | nr | 
				match = Match.new :round_id => firstRound.id
				match.save
				winLink = MatchWinLink.new :match_id => match.id, :next_match_id => scoreMatch.id
				winLink.save
				loseLink = MatchLoseLink.new :match_id => match.id, :next_match_id => scoreMatch.id
				loseLink.save
			end
		end

		def update_round ( round_nr )
			if round_nr == 1 then assign_teams_to_matches
			elsif round_nr == 2 then calculate_team_scores
			end
		end

		def assign_teams_to_matches
		end

		def calculate_team_scores
		end
	end
end
