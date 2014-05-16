require_relative './search_state.rb'
require 'json'

class StandarState < SearchState

	attr_accessor :name, :children, :value, :father, :path_cost

	def initialize(value, name, goal, children = [], father = [], path_cost = 0, search)
		@value = value
		@name = name
		@goal = goal
		@children = children
		@search = search
		@father = father
		@path_cost = path_cost
		super value
	end

	def is_final?
		@goal
	end

	def has_children?
		if @children.size > 0 then true else false end
	end

	def expand
		states = []
		children.each do |child|
			states << @search.get_node(child["name"], child["path_cost"], name)
		end
		return states
	end

	def ==(state)
		@name == state.name
	end
end