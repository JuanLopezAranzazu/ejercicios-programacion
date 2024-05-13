
# Variables iniciales
target="This is a string to reverse"

# Funciones

# def reverseString(target):
#   return target[::-1]

# def reverseString(target):
#   if(len(target) == 0):
#     return ""
#   else:
#     return reverseString(target[1:]) + target[0]

def reverseString(target):
  def helper(target,result=""):
    if(len(target) == 0):
      return result
    else:
      return helper(target[1:],target[0]+result)
  
  return helper(target)

# Pruebas
print(reverseString(target))


