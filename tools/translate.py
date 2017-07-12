# -*- coding: utf-8 -*- 
import re
import sys
import codecs
import requests
from xml.etree.ElementTree import *


def doTrans(str):
   return len(str) > 0 and (str[0:1].isalnum() or str[0:1] == '*' ) and not checkKeyword(str)
   

def checkKeyword(str):
   # title
   t = re.match(r"#+", row)
   i = re.match(r"image::", row)
   s = re.match(r"\[", row)
   f = re.match(r"{", row)
   l = re.match(r".*link:", row)
   if t or i or s or f or l:
      return True
   else:
      return False

def checkBlock(str):
   return re.match(r"-", row)

#  Source text
# word =  "it's true it's damn true."


args = sys.argv

# App Key
key = '70de40a4e86e4412a8d93d732e768e80'

# token
token = requests.post(
    'https://api.cognitive.microsoft.com/sts/v1.0/issueToken',
    params={
        'Subscription-Key': key
        }
).text

# translate
srcFile = codecs.open(args[1], 'r', 'utf-8')
fout = codecs.open('result.xml', 'w', 'utf-8')
dstFile = codecs.open(args[2], 'w', 'utf-8')

inBlock = False
word=""

for row in srcFile:
   dstFile.write(row) ,

   if checkBlock(row):
      inBlock = not inBlock

   if not inBlock:
      if doTrans(row):
         word += row
      elif len(word) > 0:
         fout = codecs.open('result.xml', 'w', 'utf-8')
         response = requests.get(
            'https://api.microsofttranslator.com/v2/http.svc/Translate',
             params={
                'contentType': 'text/plain',
                'appid': 'Bearer '+ token,
                'to':'ja',
                'text': word,
                'category': 'general'
             }
         ).text
         fout.write(response)
         fout.close()
         word = ""

         tree = parse('result.xml')
         root = tree.getroot()
         #print root.text
         dstFile.write(root.text)
         dstFile.write('\r\n')
         dstFile.write('\r\n')


if not inBlock and len(word) > 0:
   fout = codecs.open('result.xml', 'w', 'utf-8')
   response = requests.get(
      'https://api.microsofttranslator.com/v2/http.svc/Translate',
      params={
         'contentType': 'text/plain',
         'appid': 'Bearer '+ token,
         'to':'ja',
         'text': word,
         'category': 'general'
      }
   ).text
   fout.write(response)
   fout.close()
   word = ""

   tree = parse('result.xml')
   root = tree.getroot()
   dstFile.write(root.text)
   dstFile.write('\r\n')

#   elem = fromstring(response)
#   fPlain.write(elem.findtext(".//string"))


srcFile.close()
fout.close()
dstFile.close()
