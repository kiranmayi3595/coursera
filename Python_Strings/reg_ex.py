import re
hand=open(mbox-short.txt)
for line in hand:
	line.rstrip()
	if re.search('^From: ',line):   #instead of line.startswith()
		print(line)

x='My birthday is 3 and 5'
import re
y=re.findall('[0-9]+',x)
print(y)

a='From kiranmayi.vedantham@gmail.com Sat Jan 09:23:21 2021'
b=re.findall('From (/S+@/S+)',x)
print(b)
