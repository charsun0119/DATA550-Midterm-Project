final_report.html: code/05_render_report.R final_report.Rmd \
data/covid_data.rds \
output/table_one.rds \
output/regression_table.rds \
output/bar_graph.png \
output/scatterplot.png
	Rscript code/05_render_report.R
	
	
data/covid_data.rds: code/00_dataset_rds.R data/covid_sub.csv
	Rscript code/00_dataset_rds.R
	

output/table_one.rds: code/01_descriptive_stats.R data/covid_data.rds 
	Rscript code/01_descriptive_stats.R
	
	
output/regression_table.rds: code/02_regression.R data/covid_data.rds
	Rscript code/02_regression.R
	
output/bar_graph.png: code/03_make_bar.R data/covid_data.rds
	Rscript code/03_make_bar.R
	
output/scatterplot.png: code/04_make_scatter.R data/covid_data.rds
	Rscript code/04_make_scatter.R
	

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f cleandata/*rds && rm -f *.html && rm -f *.pdf
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
