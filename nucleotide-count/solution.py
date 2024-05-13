# Variables iniciales
target="AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
target2="AGGTTAC"

# Funciones
# def solver(target):
#   temp="AGCT"

#   if(any(x not in temp for x in target)):
#     raise Exception("Error")
  
#   obj={"A":0,"C":0,"G":0,"T":0}

#   for x in target:
#     obj[x]+=1
  
#   keys=list(obj.keys())
#   arr=[]

#   for x in keys:
#     arr.append([x,obj[x]])
  
#   return arr

def solver(target):
  temp="AGCT"

  def helper(lst,obj={}):
    if(len(lst)==0):
      return obj
    else:
      if(not lst[0] in temp):
        raise Exception("Error")
      else:
        obj[lst[0]]+=1
      return helper(lst[1:],obj)
  
  obj={"A":0,"C":0,"G":0,"T":0}
  obj=helper(target,obj)
  keys=list(obj.keys())
  arr=[]

  for x in keys:
    arr.append([x,obj[x]])
  
  return arr

# Pruebas
try:
  print(solver(target))
  print(solver(target2))
except Exception as ex:
  print(ex)
