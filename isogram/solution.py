import re

# Variables iniciales
target="stone"
target2="six-year-old"

# Funciones
# def isogram(target):
#   temp = re.split('-| ', target.lower())
#   for x in temp:
#     if(temp.count(x)>1):
#       return False
#   return True

def isogram(target):
  temp = re.split('-| ', target.lower())

  def helper(string):
    if(len(string)==0):
      return True
    else:
      if(string.count(string[0])>1):
        return False
      else:
        return helper(string[1:])
  
  return helper(temp)

# Pruebas
print("Es isograma" if(isogram(target)) else "No es isograma")
print("Es isograma" if(isogram(target2)) else "No es isograma")
