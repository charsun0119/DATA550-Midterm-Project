# DATA550 Midterm Project - Group 4 
Katherine Cho, Shreya Shankar, Kirsten Reid, Annie Nicholas, Yijing Sun
Dataset: COVID-19 (information regarding covid-19 cases in Mexico) 

### Description
The data is from a randomized trial testing whether a modified milk formula (f75) improves outcomes for children with severe acute malnutrition (first 6-months of data from year-long study). This purpose of this project is to produce reproducible analysis of the dataset. 

### Directory Structure
- Code: All codes that are used to generate tables, figures, and analysis
- Output: The outputs of the codes
- Data: Original dataset, both in .csv and .rds
- The final report (final_report.rmd), Makefile, and .gitignore can be found in the main directory.

### Building the Project
This project uses a Makefile to ensure that all analyses and outputs can be reproduced. To build the entire project (including tables, regression outputs, and the final report), run "make" in R terminal; to remove previously generated files, run "make clean".

### Customization
- We define a parameter in the YAML header that controls the echo option for all R code chunks. This allows us to render either a “default” report (code hidden) or a “test” report (code shown) without modifying the .Rmd file.
- The Makefile includes separate rules to build. For instance, echo = 0 means that the code will be hidden in the final knitted report.
- All scripts use the here package to create consistent paths for the customization of directory structures. The makefile is used to customize which outputs will be produced. 




