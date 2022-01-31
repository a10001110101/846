import os
import shutil
import datetime
import pandas as pd
from datetime import datetime

global timestr
timestr = datetime.now().strftime("%Y%m%d")

if os.path.exists("E:/Scripts/CSVStore/TPL846.xlsx"):
  shutil.copyfile("E:/Scripts/CSVStore/TPL846.xlsx", "E:/Scripts/CSVStore/XLSXArchive/TPL846-" + timestr + ".xlsx")
else:
  pass

df = pd.read_excel("E:/Scripts/CSVStore/TPL846.xlsx")
df.to_csv("E:/Scripts/CSVStore/CSV/TPL846.csv", index=False)

if os.path.exists("E:/Scripts/CSVStore/CSV/TPL846.csv"):
  shutil.copyfile("E:/Scripts/CSVStore/CSV/TPL846.csv", "E:/Scripts/CSVStore/CSVArchive/TPL846-" + timestr + ".csv")
else:
  pass