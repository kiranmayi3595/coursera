counts=dict()
line=input('Enter a line of text:')
words=line.split()
for word in words:
	counts[word]=counts.get(word,0)+1
print(counts)




counts={'Simon':2,'Fred':42,'Mark':57}
print(list(counts))
print(counts.keys())
print(counts.values())
print(counts.items())

for k,v in counts.items():
	print(k,v)
