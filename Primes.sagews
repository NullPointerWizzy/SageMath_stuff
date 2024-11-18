︠9a243374-a750-4014-bca2-d509605b2137s︠
1728/6
︡613e1b66-3f79-405f-8252-cfe0dc0d574f︡{"stdout":"288\n"}︡{"done":true}
︠54d56682-30c7-47b8-a055-05f58e0a3d53s︠
1728/18
︡d788fc01-e0a7-4b40-8b2d-ab4c2b1ad269︡{"stdout":"96\n"}︡{"done":true}
︠10fe361d-9732-4a1c-a9b4-be986cb59805s︠
ZZ(15)

def mkinze():
    cpt = 0
    for i in range (15):
        if (i^14 % 15) == 1:
            cpt = cpt+1
    return cpt

print(mkinze())
︡0637ad32-e6ae-4972-a745-186f93c84e28︡{"stdout":"15\n"}︡{"stdout":"4\n"}︡{"done":true}
︠e0690e7f-b411-4e9e-9076-ab679e79a541s︠

factor(561)
︡d0bff76e-2084-4b29-8690-6edfeca60494︡{"stdout":"3 * 11 * 17\n"}︡{"done":true}
︠b6cdfc62-4c12-4dbb-9c2e-ba20b504c698s︠
factor(561)[0]
︡ea5304e2-0cc2-42fe-9870-1a7acc545675︡{"stdout":"(3, 1)\n"}︡{"done":true}
︠cfcbe963-272b-4118-b53e-de096cd61699s︠
#critere de Korselt test si n est de Carmi ou pas
def mystere(n):
    F=factor(n)
    if len(F)<=1 :
        return False
    for f in F :
        if f[1]>1 :
            return False
    for f in F :
        if (n-1) % (f[0]-1) != 0 :
            return False
    return True

mystere(560)


#R = IntegerModRing(n)

def listeCarmi(n):
    l = []
    count = 0
    index = 1
    while count < n:
        if(mystere(index)):
            l.append(index)
            count += 1
        index += 1
    return l

listeCarmi(30)

︡b7c196fb-95b2-440c-9ed0-ce5dcace6e4d︡{"stdout":"False\n"}︡{"stdout":"[561, 1105, 1729, 2465, 2821, 6601, 8911, 10585, 15841, 29341, 41041, 46657, 52633, 62745, 63973, 75361, 101101, 115921, 126217, 162401, 172081, 188461, 252601, 278545, 294409, 314821, 334153, 340561, 399001, 410041]"}︡{"stdout":"\n"}︡{"done":true}
︠8721fd72-efce-4f60-9692-873410be3d10s︠

def testFermat(n,a):
    d = gcd(a,n)
    if d!=1:
        print("n est composé et gcd(a,n) est un facteur non trivial")
        return

    b = power_mod(a, n - 1, n)

    if b != 1:
        print("n est composé")
        return
    if b == 1:
        print("ptetre n est premier")

testFermat(561, 2)
︡7b573605-037a-49fa-b144-fda3795e208c︡{"stdout":"ptetre n est premier\n"}︡{"done":true}
︠2ce8cc50-8270-4828-9717-0c064c42fb02︠

def test(n, k):
    result = true
    for i in range(k):
        value = randrange(1, n-1)
        result = result and testFermat(n, value)
    return result

test(10^20 + 67, 10)
︡b487466d-6797-49b0-b609-9ebe7f86ab76︡{"stdout":"n est composé\n"}︡{"done":true}
︠86575dee-ec85-49ec-8b33-e451de8c8e41r︠


from sys import stdout
from math import sqrt, log

def is_prime ( p ):
    if p == 2: return True # Lucas-Lehmer test only works on odd primes
    elif p <= 1 or p % 2 == 0: return False
    else:
    for i in range(3, int(sqrt(p))+1, 2 ):
        if p % i == 0: return False
    return True

def is_mersenne_prime ( p ):
      if p == 2:
        return True
      else:
        m_p = ( 1 << p ) - 1
        s = 4
        for i in range(3, p+1):
            s = (s ** 2 - 2) % m_p
        return s == 0

precision = 20000   # maximum requested number of decimal places of 2 ** MP-1 #
long_bits_width = precision * log(10, 2)
upb_prime = int( long_bits_width - 1 ) / 2    # no unsigned #
upb_count = 45      # find 45 mprimes if int was given enough bits #

print (" Finding Mersenne primes in M[2..%d]:"%upb_prime)

count=0
for p in range(2, int(upb_prime+1)):
  if is_prime(p) and is_mersenne_prime(p):
    print("M%d"%p),
    stdout.flush()
    count += 1
  if count >= upb_count: break
print

xgcd(7,5)
︡7e1ee123-0f5e-4a20-be69-9facf830a77a︡{"stdout":"(1, -2, 3)\n"}︡{"done":true}
︠fcbc4388-ae41-4154-bf0e-2126757df244︠









