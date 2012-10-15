require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ComposHelper. For example:
#
# describe ComposHelper do
#	 describe "string concat" do
#		 it "concats two strings with spaces" do
#			 helper.concat_strings("this","that").should == "this that"
#		 end
#	 end
# end
describe ComposHelper do


	describe "Round Robin" do

		before(:each) do
			@compo = FactoryGirl.create(:compo)
			@compo.competition_type = "Round Robin"
			@compo.slots = 3
			@matchGenerator = ComposHelper::RoundRobin.new @compo
			@matchGenerator.generate
		end

		it "should create 2 rounds in the database." do 
			Round.all.count.should == 2
		end

		it "Should ceate 1 match in round 2." do
			lastRound = @matchGenerator.rounds[ 2 ]
			lastRound.matches.count.should == 1
		end 

		it "Should create 6 matches in round 1." do
			firstRound = @matchGenerator.rounds[ 1 ]
			firstRound.matches.count.should == 6
		end 

		it "Should link every game in round 1 to the game in round 2" do
			firstRound = @matchGenerator.rounds[ 1 ]
			lastRound = @matchGenerator.rounds[ 2 ]
			finalMatch = lastRound.matches[0]

			firstRound.matches.each do |match|
				match.next_match_after_win.should == finalMatch
				match.next_match_after_loss.should == finalMatch
			end
		end

		it "Should pich each team agians each other team."
		it "Should update the final scores correctly."

	end

	describe "Elimination" do

		before(:each) do
			@compo = GactoryGirl.create(:compo)
			@compo.stots = 8
			@compo
		end

		it "Should create the right amount of rounds"
		it "Should create the right amount of matches in each round."
		it "Should link up all win links to matches in the next round."
		it "Should not have any links for losing the match."

	end

	describe "Double Elimination"
	describe "Group Stages"

end
