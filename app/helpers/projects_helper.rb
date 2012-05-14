module ProjectsHelper
	require 'SVG/Graph/Pie'
	require 'SVG/Graph/Bar'
	
	def show_allocation_pie_chart(project)
		fields = project.accounts.map { |account| account.name }
		data = project.accounts.map { |account| account.allocations.sum(:value) }
		graph = SVG::Graph::Pie.new({ :height => 250, :width => 300, :fields => fields})
		graph.add_data({ :data => data, :title => 'Allocation per accounts' })
		
		graph.burn()
	end
	
	def show_expenses_pie_chart(project)
		fields = project.accounts.map { |account| account.name }
		data = project.accounts.map { |account| account.expenses.sum(:value) }
		graph = SVG::Graph::Pie.new({ :height => 250, :width => 300, :fields => fields})
		graph.add_data({ :data => data, :title => 'Expenses per accounts' })
		
		graph.burn()
	end
	
	def show_progression_pie_chart( project )
		return "" if project.span == 0
		case project.span.count
			when 1..30
				step = 1
			when 31..180
				step = 5
			else
				step = 30
		end
		fields = project.span.step(step).to_a
		data1 = project.span.step(step).map { |edate| project.allocations.effective(edate).sum(:value) }
		data2 = project.span.step(step).map { |edate| project.expenses.effective(edate).sum(:value) }
		data3 = project.span.step(step).map { |edate| project.expenses.effective(edate).spent.sum(:value) }
		graph = SVG::Graph::Bar.new({ :height => 250, :width => 960, :fields => fields})
		graph.add_data({ :data => data1, :title => 'Allocated'})
		graph.add_data({ :data => data2, :title => 'Projected'})
		graph.add_data({ :data => data3, :title => 'Spent'})
		graph.rotate_x_labels = true
		graph.scale_integers = true
		graph.show_data_values = false
		
		graph.burn()
	end
	def account_progression( account )
		project_span = account.project.span
		case project_span.count
			when 0
				return ""
			when 1..30
				step = 1
			when 31..180
				step = 5
			else
				step = 30
		end
		fields = project_span.step(step).to_a
		data1 = project_span.step(step).map { |edate| account.allocations.effective(edate).sum(:value) }
		data2 = project_span.step(step).map { |edate| account.expenses.effective(edate).sum(:value) }
		data3 = project_span.step(step).map { |edate| account.expenses.effective(edate).spent.sum(:value) }
		graph = SVG::Graph::Bar.new({ :height => 250, :width => 960, :fields => fields})
		graph.add_data({ :data => data1, :title => 'Allocated'})
		graph.add_data({ :data => data2, :title => 'Projected'})
		graph.add_data({ :data => data3, :title => 'Spent'})
		graph.rotate_x_labels = true
		graph.scale_integers = true
		graph.show_data_values = false
		
		graph.burn()
	end
end

