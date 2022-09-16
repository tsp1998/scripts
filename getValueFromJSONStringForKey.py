import sys
import json

try:
  _, jsonString, key = sys.argv
  object = json.loads(jsonString)
  print(object[key])
except:
  print('')