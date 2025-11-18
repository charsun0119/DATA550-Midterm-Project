project: final_report.html

output/table_one.rds: code/table_one.R data/covid_data.rds
	Rscript code/table_one.R
	
output/regression_table.rds: code/02_regression.R data/covid_sub.csv
	Rscript code/regression.R

final_report.html: final_report.Rmd output/regression_table.rds output/table_one.rds
	Rscript -e "rmarkdown::render('final_report.Rmd')"

clean:
	rm -f output/*.rds
	rm -f final_report.html

.PHONY: all clean
