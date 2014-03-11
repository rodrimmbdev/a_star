require 'model/a_star'
require 'model/node'

describe AStar do

	before(:each) do
		@a_star = AStar.new
    end

	it 'first node is the goal node' do
		state = create_state(true, 8, [], false)

		initial_node = Node.new(state)
		goal_node = initial_node

		expected_path = goal_node.path

		expect(@a_star.find_path(initial_node)).to eq expected_path
	end

	
	it 'node with two children that one of them was a goal' do
		state_goal = create_state(true, 3, [], false)
		goal = Node.new(state_goal)

		state_child = create_state(false, 5, [], false)
		child = Node.new(state_child)

		state_initial = create_state(false, 4, [state_child, state_goal], true)
		initial = Node.new(state_initial)

		expected_path = [initial, goal]

		expect(@a_star.find_path(initial)).to eq expected_path
	end

	it 'tree with 3 levels and one node goal' do
		state_child1_1_1 = create_state(false, 111, [], false)
		state_child1_1_2 = create_state(false, 112, [], false)
		state_child1_2_1 = create_state(false, 121, [], false)
		state_goal = create_state(true, 3, [], false)
		goal = Node.new(state_goal)

		state_child1_2 = create_state(false, 12, [state_child1_2_1, state_goal], true)
		state_child1_1 = create_state(false, 11, [state_child1_1_1, state_child1_1_2], true)
		child1_2 = Node.new(state_child1_2)

		state_initial = create_state(false, 4, [state_child1_1, state_child1_2], true)
		initial = Node.new(state_initial)

		expected_path = [initial, child1_2, goal]


		expect(@a_star.find_path(initial)).to eq expected_path
	end
	
end

def create_state(is_final, value, expand, children)
	state = double "state"
  	state.stub(:is_final? => is_final)
  	state.stub(:value => value)
  	state.stub(:expand => expand)
  	state.stub(:has_children? => children)
  	state
end