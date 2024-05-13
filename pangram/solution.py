
# Variables iniciales
target="stone"
target2="The quick brown fox jumps over the lazy dog"

# Funciones
# def pangram(target):
#   alphabet = "abcdefghijklmnopqrstuvwxyz"
#   temp=target.lower()
#   for x in alphabet:
#     if(temp.count(x)==0):
#       return False
#   return True

def pangram(target):
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  temp=target.lower()
  def helper(string):
    if(len(string)==0):
      return True
    else:
      if(temp.count(string[0])==0):
        return False
      else:
        return helper(string[1:])
  
  return helper(alphabet)

# Pruebas
print("Es pangrama" if(pangram(target)) else "No es pangrama")
print("Es pangrama" if(pangram(target2)) else "No es pangrama")
