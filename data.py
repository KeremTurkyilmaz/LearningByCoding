# Genera un json con i progetti della repository
# Utilizzo:
# > python data.py > [path]data.js
#
# NOTA:
# Trasformazione dell'URL delle immagini:
# https://github.com/KeremTurkyilmaz/TypeMistmatchSketch/blob/master/Anti%20Selfie/image/AntiSelfie.png
# ...diventa:
# https://raw.githubusercontent.com/KeremTurkyilmaz/TypeMistmatchSketch/master/Anti%20Selfie/image/AntiSelfie.png


import os
import re
import json

root = './'
dest = './data.js'
github_base_url = 'https://github.com/KeremTurkyilmaz/TypeMistmatchSketch/tree/master/'

regex = re.compile(r'([^(]+)\s*\(([^)]+)\)\s*(?:,\s*|$)')

out = []

for file in os.listdir(root):
 	if os.path.isdir(file):
 		try:
 			print "Parsing " + file + "... "

 			readme = open(file + '/README.md', 'r')
 			
 			content = readme.read()
 			sections = content.split('\n\n')

 			# 1. immagine
 			img_url = sections[0].strip()
			img_url = regex.match(img_url).group(2)
			img_url_abs = img_url
			img_url_abs = img_url_abs.replace('github.com', 'raw.githubusercontent.com')
			img_url_abs = img_url_abs.replace('blob/', '')			
 			
 			# 2. titolo 			
 			titolo = sections[1].strip('#').strip()
 			
 			# 3. data
 			data = sections[2].strip('#').strip()
 			
 			# 4. descrizione
 			desc = sections[3].strip()
 			
 			# 5. tags
 			tags = sections[4].split('\\#')
 			tags = [word.strip() for word in tags]
 			tags = filter(None, tags)

 			# 6. url
 			url = github_base_url + file
 			
			out.append({'titolo':titolo, 'img_url':img_url, 'img_url_abs':img_url_abs, 'data':data, 'desc':desc, 'tags':tags, 'url' : url})

			readme.close()
			
 		except (IOError, OSError) as err:
			print "Errore >>>>>> " + file + "/README.md non trovato!"

json_file = open(dest, "w")
json_file.write( "const data = " + json.dumps(out, indent=4, sort_keys=True) )
json_file.close()



