module SuppliersHelper
	def supplier_progression( supplier )
		start_date = supplier.expenses.minimum( :effective_date )
		end_date = supplier.expenses.maximum( :effective_date )
		expense_span = start_date..end_date
		case expense_span.count
			when 0
				return ""
			when 1..30
				step = 1
			when 31..180
				step = 5
			else
				step = 30
		end
		fields = expense_span.step(step).to_a
		data2 = expense_span.step(step).map { |edate| supplier.expenses.effective(edate).sum(:value) }
		data3 = expense_span.step(step).map { |edate| supplier.expenses.effective(edate).spent.sum(:value) }
		graph = SVG::Graph::Bar.new({ :height => 250, :width => 960, :fields => fields})
		graph.add_data({ :data => data2, :title => 'Projected'})
		graph.add_data({ :data => data3, :title => 'Spent'})
		graph.rotate_x_labels = true
		graph.scale_integers = true
		graph.show_data_values = false
		graph.style_sheet = '/assets/graph.css'
		
		graph.burn()
	end
end
