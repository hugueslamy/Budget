module AccountsHelper
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
		graph.style_sheet = '/assets/graph.css'
		
		graph.burn()
	end
end
