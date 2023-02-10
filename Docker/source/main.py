import os
from pathlib import Path
from datetime import datetime

# Set output folder relatively to script location
output_path_folder = Path("Output")
print(output_path_folder)
output_path_folder.mkdir(parents=True, exist_ok=True)

# Get text from environment variable
text = os.getenv("TEXT")


# Prepare outpupt file name
output_file_path = output_path_folder/ f'result-{datetime.now().strftime("%Y-%m-%d-%H-%M-%S")}.txt'
print(output_file_path)

# Save text to file
with open(output_file_path, "w") as new_file:
    new_file.write(text)