require 'node'

describe Node do
		
	context 'single node' do
		before(:each) do
      		@name = "A"
      		@value = 4
			@node = Node.new(@value, @name)
    	end

		it 'should has a name' do
			expect(@node.name).to be @name
		end

		it 'has a 0 deep if it hasn\'t parent' do
			expect(@node.deep).to eq 0
		end

		it 'has a value' do
			expect(@node.value).to eq @value
		end

		it 'can change the value' do
			expect(@node.value).to eq @value
			expect(@node.set_value(10).value).to eq 10
		end
	end

	context 'node with one child' do 
		before(:each) do
      		father = "father"
			child = "child"
			@node_father = Node.new(0, father)
			@node_child = Node.new(0, child, @node_father)
			@node_father.set_children(@node_child)
    	end

		it 'father node shold have a child' do
			expect(@node_father.children[0]).to be @node_child
		end

		it 'child shold have a parent' do
			expect(@node_child.parent).to be @node_father
		end

		it 'the deep of node child should be 1' do
			expect(@node_child.deep).to eq 1
		end

		it 'can put another child to the father node' do
			expect(@node_father.children.size).to be 1
			expect(@node_father.set_children(Node.new(0,"child_2")).children.size).to be 2
		end
	end

	context 'tree with various nodes' do
		before(:each) do
			@node_A = Node.new(0, "A")
			@node_B = Node.new(0, "B", @node_A)
			@node_C = Node.new(0, "C", @node_A)

			@node_D = Node.new(0, "D", @node_B)
			@node_E = Node.new(0, "E", @node_B)

			@node_F = Node.new(0, "F", @node_C)			

			@node_B.set_children([node_D, node_E])
			@node_C.set_children(node_F)

			@node_A.set_children([node_B,node_C])
    	end
	end
end