class Round < ActiveRecord::Base
	attr_accessible :compo_id
	attr_accessible :level

	validates_presence_of :compo

	has_many :matches
	belongs_to :compo
end
