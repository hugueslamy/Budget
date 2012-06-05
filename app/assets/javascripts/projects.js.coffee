# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> $('#project_start_date').datepicker changeYear: true, changeMonth: true, dateFormat: "yy-mm-dd"
$ -> $('#project_end_date').datepicker changeYear: true, changeMonth: true, dateFormat: "yy-mm-dd"