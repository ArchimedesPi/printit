#PYTHON!!!

f = open('bom.bom', 'r')
parts = []

for line in f:
  stripit = [x.strip() for x in line.split(',')]
  parts.append({'file': stripit[0], 'times': int(stripit[1])})

for part in parts:
  print "Slicing part {file}"
  
  print "Printing part {file} {times} times".format(file=part['file'], times=part['times'])
  for i in range(0, part['times']):
    print 'print'