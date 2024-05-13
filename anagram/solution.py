
# Variables iniciales
target="stone"
lst=["stone", "tones", "banana", "tons", "notes", "Seton"]

# Funciones
# def helper(string):
#   return "".join(sorted(string.lower()))

# def anagrams(target,lst):
#   arr=[]
#   temp=helper(target)

#   for x in lst:
#     if(not target==x and temp==helper(x)):
#       arr.append(x)

#   return arr

def sortString(string):
  return "".join(sorted(string.lower()))

def anagrams(target,lst):
  temp=sortString(target)

  def helper(lst,arr=[]):
    if(len(lst)==0):
      return arr
    else:
      if(not target==lst[0] and temp==sortString(lst[0])):
        return helper(lst[1:],arr+[lst[0]])
      else:
        return helper(lst[1:],arr)
  
  return helper(lst)
    

# Pruebas
print(anagrams(target, lst))

