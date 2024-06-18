fname=open('test.rtf')
count=dict()
for line in fname:
	stu=line.split()
	for word in stu:
		count[word]=count.get(word,0)+1
#print(count)

new=list()
for k,v in count.items():
	new.append((v,k))
#print(new)

new=sorted(new,reverse=True)
for v,k in new[:10]:
	print(k,v)




