# -*- coding: utf-8 -*-

# import numpy as np
# import matplotlib.pyplot as plt
import pandas as pd
import os

# Set the path to your main folder
main_folder = r'C:\Dokumenter_ny\Python _min\Turbomachinery\output'

# Check if the main folder exists
if not os.path.exists(main_folder):
    print(f"The folder '{main_folder}' does not exist.")
else:
    # Initialize an empty dictionary to store DataFrames
    all_data_dict = {}

    # Loop through each subfolder in the main folder
    for subdir, dirs, files in os.walk(main_folder):
        for file in files:
            # Check if the file is a CSV file
            if file.endswith('.csv'):
                # Construct the full path to the CSV file
                csv_path = os.path.join(subdir, file)
                
                # Read the CSV file into a DataFrame
                current_data = pd.read_csv(csv_path)
                
                # Store the current data in the dictionary with the file name as the key
                all_data_dict[file] = current_data

    # Order the dictionary alphabetically by keys and create a DataFrame
    df = pd.concat(sorted(all_data_dict.items()), axis=1)

# Determine mean values
df_mean_values = pd.concat(df).groupby(level=0).mean()







