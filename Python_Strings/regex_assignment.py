import re
total=0
hand=open('regex_1.txt','r')
for line in hand:
	numbers=re.findall('[0-9]+',line)
	if not numbers:
		continue
	else:
		for num in numbers:
			total=total+int(num)
print(total)
