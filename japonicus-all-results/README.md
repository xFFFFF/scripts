# japonicus all results
The authors of Genetic algorhirtms for Gekko do not provide all the results that their algorithm generates. An example of how to do against their will is here. The first file is a modified japonicus file, so that it writes the results of backtests to a csv file. The second one is to generate separate toml files, which then we load into BacktestTool and check the settings for more pairs.

PS   
The source of the .pl file is an example filter for the csv file written in bash. With its help, the results will include: configs that on 4-9 pairs had PnL >= 0, trades <69.
