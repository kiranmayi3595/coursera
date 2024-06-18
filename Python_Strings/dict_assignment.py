#Write a program to read through the mbox-short.txt and figure out who has sent the greatest number of mail messages. The program looks for 'From ' lines and takes the second word of those lines as the person who sent the mail. The program creates a Python dictionary that maps the sender's mail address to a count of the number of times they appear in the file. After the dictionary is produced, the program reads through the dictionary using a maximum loop to find the most prolific committ



name = input("Enter file:")
if len(name) < 1:
    name = "mbox-short.txt"
handle = open(name)
lst=list()
person=list()
count=dict()
for line in handle:
    if not line.startswith('From '):
        continue
    lst=line.split()
    l=lst[1]    
    count[l]=count.get(l,0)+1
bigword=None
bigcount=None        
for k,v in count.items():
    if bigcount is None or v>bigcount:
        bigword=k
        bigcount=v
print(bigword,bigcount)