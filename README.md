This manuscript presents the applicabilty of TLBO-KRSM optimization algorithm to estimate site-specific Vs profile along with the Vs profile from other optimization algorithms (PSO, ABCO, GA, DE) using MASW techniques.

Important: The explanations of Gentic Algorithm (GA) algorithm is given here.
           The explanation of each matlab code are written infront of respective lines.
           Repository "Site-1-Optimization-GA" consist of several matlab supporitng files.

           
Please adopt the following steps to run the code.

Guideline for quick test of Site-1-optimization-GA data
Step-1:  Matlab files "c_curve0.mat" and "lambda_curve0" correspond to the Phase velocity and waveleght vector, respectively. There are 6 points on fundamental mode Disperison curve at Site-1.
Step-2: Open folers "GA_SOLVER.m" in which lower and upper search spaces are defined as given in the manuscript.
Step-3: Input the parameters of GA algorithm as per given in manuscript. 
Step-4: Run the "GA_SOLVER.m" code and wait to complete 100 iterations.
Step-5: At 100th iteration, Best solutions (thickness and Vs) are obtained. Further, these best solutions are used again in "MASWaves.m" code, which is given in the Repository "Site-1-Optimization-MASW-analysis".
