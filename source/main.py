import argparse
from pathlib import Path
from datetime import datetime

# Set output folder relatively to script location
output_path_folder = Path(__file__).parent / ".." / "Output"
output_path_folder = output_path_folder.resolve()
print(output_path_folder)
output_path_folder.mkdir(parents=True, exist_ok=True)

parser = argparse.ArgumentParser(
    prog="Output test to file"
)

parser.add_argument("-t", "--text", type=str)
args = parser.parse_args()


# Prepare outpupt file name
output_file_path = output_path_folder/ f'result-{datetime.now().strftime("%Y-%m-%d-%H-%M-%S")}.txt'
print(output_file_path)
with open(output_file_path, "w") as new_file:
    new_file.write(args.text)