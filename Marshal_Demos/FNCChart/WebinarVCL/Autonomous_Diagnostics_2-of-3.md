# Autonomous Dashboard Diagnostics: 2 of 3 - Data Heuristics

Your presentation begins in 18 minutes and your review of the dashboard identifies a defect in the bar chart, missing data for 2019. Marshal enables you to quickly check some basic configuration and SQL results to identify the defect.

Join us in a live webinar on Nov 15 where I use Marshal to resolve these issues and explore other diagnostics.

This post resumes diagnostics at 9:42 before the 10:00 presentation. If you missed part 1, please take a look at here.

## 9:42

Hoping for a quick fix, you begin with checking the components that populate the chart series. Object Plus confirmst the chart's adatper field is assigned to the chartDBAdaptStackedBar adapter. Object Plus shows the adapter active and is assigned to a datasource, dsSalesBarChart. Moving down you use Object Plus to inspect the datasource, it is enabled and connected to a dataset, fdqSalesChart. Lastly you use Object Plus to check the query has a db connection and is active. Fortunately all the components are assigned and in the correct state. Marshal assigns a dedicated tab per component allowing you to quickly switch between components. Now you must look into the data to resolve this issue.

## 9:44

Marshal's DataSet Grid inspector, a specialized inspector assigned to TDataset descendants, allows you to view the contents of the query in a grid. After verifying the column SA2019 is empty, you right click and save the contents of the dataset to CSV in case you need to analyze it later. (In this demo the data for 2019 is missing, most of the time the problem is data discrepancy so saving a CSV would be a great artifact for later analysis.)

## 9:46

Time to dig in deeper, you must verify the SQL used by the FDquery is returning the correct results from the database. Object Plus allows you to view the  text of the SQL by displaying a TStrings editor. You copy the SQL to the clipboard and then open the FDconnection. Marshal's Query Tool, a specialized inspector for TFDConnection components, allows you to exectue ADHOC SQL commands using the applications connection. You paste the clipboard SQL and execute the query to reveal that 2019 data is available.

## 9:48

You decide to reload the FDquery by deactivating (active = false) and then activating (active = true). Now the chart shows data for all 3 years and you are ready to present at 10:00.

## Process Improvement

ETL delays are common operational issues that make diagnosing user issues very hard. As a developer you could log all the data coming from the database. Here you used heuristics to confirm the problem at the moment. An option to make the application more resilient would be add a button to refresh. Root cause of the ETL delay should be established but a refresh button would provide a quick option for the user to resolve the issue.

The same technique can be used for issues where you need to modify the SQL by adding an upper or trim to get items to group and sort correctly.

## Involve Others

Marshal is a tool that could be used by either application support or power users to help gather this type of heuristic information. As a developer you gain confidence in a fix when you can reproduce a problem and identify the test parameters. Gathering heuristics can help identify where test datasets need to be expanded to emulate production data discrepancies.


The final part of this series will cover Marshal custom inspectors and demo how to use a chart editor at runtime to add a little value to the chart displayed.



Compiled samples and source can be found in the following repository on GitHub.

https://github.com/SwiftExpat/RunTime-ToolKit/tree/main/Samples/FNCChart
