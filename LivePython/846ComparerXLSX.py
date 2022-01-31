import csv
import os
import pyexcel
import openpyxl
import shutil
import datetime
from openpyxl import load_workbook
from openpyxl import worksheet
from datetime import datetime

global timestr
timestr = datetime.now().strftime("%Y%m%d")

if os.path.exists("E:/Scripts/XLSXFormat/846Complete.xlsx"):
  os.remove("E:/Scripts/XLSXFormat/846Complete.xlsx")
else:
  pass

if os.path.exists("E:/Scripts/846Export.csv"):
  sheet = pyexcel.get_sheet(file_name="E:/Scripts/846Export.csv", delimiter=",")
  sheet.save_as("E:/Scripts/XLSXFormat/846Complete.xlsx")
else:
  pass

if os.path.exists("E:/Scripts/XLSXFormat/846Complete.xlsx"):
  workbook = load_workbook("E:/Scripts/XLSXFormat/846Complete.xlsx")
  worksheet = workbook['846Export.csv']
  worksheet.insert_rows(1)
  worksheet["A1"] = "TPL Qty"
  worksheet["B1"] = "TPL Item Number"
  worksheet["C1"] = "ERP Item Number"
  worksheet["D1"] = "ERP Qty"
  worksheet["E1"] = "Unit Cost"
  worksheet["F1"] = "Allocation"
  worksheet["G1"] = "Variance"
  worksheet["H1"] = "Cost Variance"
  worksheet["G2"] = "=sum(A2-D2)"
  worksheet["H2"] = "=sum(F2*G2)"
  workbook.save("E:/Scripts/XLSXFormat/846Complete.xlsx")
else:
  pass

if os.path.exists("E:/Scripts/846Export.csv"):
  shutil.copyfile("E:/Scripts/846Export.csv", "E:/Scripts/CSVArchive/846Export-"+ timestr +".csv")
else:
  pass

if os.path.exists("E:/Scripts/XLSXFormat/846Complete.xlsx"):
  shutil.copyfile("E:/Scripts/XLSXFormat/846Complete.xlsx", "E:/Scripts/XLSXFormat/Archive/846Complete-"+ timestr +".xlsx")
else:
  pass