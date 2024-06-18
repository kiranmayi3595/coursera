#Tuples are immutable
x=('Glenn','Sally','McLan')
print(x[2])

(y,z)=(1000,4)
print(y,z)

dd=dict()
dd['Cwen']=1
dd['Czar']=2
for (k,v) in dd.items():
	print(k,v)

sorted(dd.items()) #will loop in key order

c={'Shawn':2,'Mendes':4,'Cabello':5}
temp=list()
for k,v in c.items():
	temp.append((v,k))
print(temp)
temp=sorted(temp, reverse = True)
print(temp)





