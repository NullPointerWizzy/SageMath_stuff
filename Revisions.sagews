︠bf7f0467-9264-4cde-84cd-c3cbc218c448s︠

### changer q en fonction du corps, Q1 et le nombre
### dans l'appel de cantor-zassenhaus/degresEfaux en fonction du
### degre des polynomes facteurs qu'on veut

q = 17
k.<a> = GF(q)
QRING= PolynomialRing(QQ,x)
kx.<x> = PolynomialRing(k)

def cantorZassenhaus(d,Q):
    n = Q.degree()
    if n == d:
            return "Q irred <3"
    a = kx.random_element((0,n-1))
    D = gcd(a,Q)
    if D != 1:
        return D
    B = pow(a,((q^d)-1)/2,Q)
    D = gcd(B-1,Q)

    if D==1 or D == Q:
        return "echec"
    return D

Q1= x^18 + 3*x^17 + 5*x^16 + 12*x^15 + 11*x^14 + x^13 + 16*x^12 + 16*x^11 + 8*x^10+4*x^9+13*x^8+16*x^7+4*x^6+8*x^5+1*x^4+10*x^3+9*x^2+3*x^1+13
cantorZassenhaus(5,Q1)
#le 5 ici represente la puissance de 2
︡fc0810df-ee9f-4cc8-bc25-040ffc136810︡{"stdout":"'echec'\n"}︡{"done":true}
︠9e586811-7e72-4d03-ab68-359e88934195s︠


def cantorZassenhaus2(d,Q):
    n = Q.degree()
    d2= d
    Q2= Q

    a = kx.random_element((0,n-1))
    D = gcd(a,Q)
    if D != 1:
        return D
    B = pow(a,((q^d)-1)/2,Q)
    D = gcd(B-1,Q)

    if D==1 or D == Q:
        return cantorZassenhaus2(d2,Q2)
    return D



def degreesEfaux(Q, d):
    if Q.degree() == d:
        return [Q]
    D = cantorZassenhaus(d, Q)

    while type(D) == str:
        D = cantorZassenhaus(d, Q)
    return degreesEfaux(D, d) + degreesEfaux(Q // D, d)

degreesEfaux(Q1, 6)
#le 6 ici c'est les degres 6
︡4ce3c4d7-81aa-49d8-8569-772c3a3d9b4f︡{"stderr":"Error in lines 21-21\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\nNameError: name 'Q1' is not defined\n"}︡{"done":true}︡
︠aee5ce7d-e6b0-4bf3-8d1b-bf799c42ba7bs︠

︡04a7ddad-213a-410d-a228-9b94432b2277︡{"done":true}
︠32a136c9-cdd2-4ed6-b8a2-37cf5f2c40e2s︠
p = 10007
Zp = IntegerModRing(p)
from sage.rings.polynomial.polynomial_element import Polynomial
from sage.all import var
x = var('x')

def secret(p,T,s):
    Zp=IntegerModRing(p)
    kx.<x>=PolynomialRing(Zp)
    n = len(T)
    Q=kx.random_element(n-1)

    P = s+Q-Q(0)

    X = []
    for i in range (n):
        X.append(P(T[i]))

    return X

S = 4
secret(10007,[1,2,3],S)
︡9856a114-e4f5-4239-a893-056659e8837f︡{"stdout":"[2855, 6520, 992]"}︡{"stdout":"\n"}︡{"done":true}︡
︠a471d0de-d866-41b9-9a6b-67e19d1188d4s︠
### INTERPO LAGRANGE
#p = R.lagrange_polynomial([(t1,x1), ...])
Ax.<x> = PolynomialRing(GF(10007))
points = [(1,1707),(2,8016),(3,4310),(4,9802),(5,9049),(6,5879),(7,557),(8,5818),(9,3247),(10,7072)]
p = Ax.lagrange_polynomial(points)
print(p(0))



︡638e8697-4019-4aa6-b8ce-5e8fe5a8d0ff︡{"stdout":"2023\n"}︡{"done":true}
︠8fc73123-0564-4bf8-be67-9e96fd3f191cs︠

#bases de Groebner
A.<x, y> = PolynomialRing(RationalField(), 2, order='deglex')
f1 = x^2 + 2*y^2 - 3
f2 = x ^2 + x*y + y^2 - 3
I = ( f1 , f2 )* A
G = I.groebner_basis()
print(G)
print(f1)


var('x y')
f = x^2 + 2*y^2 - 3
g = x*y - y^2
h = y^3 - y

eq1 = x^2 + 2*y^2 == 3
eq2 = x ^2 + x*y + y^2 == 3
solve([eq1,eq2],x,y)
︡d74ceeaf-ea36-47b1-868a-9d1a43aaa4cf︡{"stdout":"[y^3 - y, x^2 + 2*y^2 - 3, x*y - y^2]\n"}︡{"stdout":"x^2 + 2*y^2 - 3\n"}︡{"stdout":"(x, y)\n"}︡{"stderr":"Error in lines 14-14\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"/ext/sage/10.1/src/sage/symbolic/relation.py\", line 1135, in solve\n    m = maxima(f)\n        ^^^^^^^^^\n  File \"sage/misc/lazy_import.pyx\", line 409, in sage.misc.lazy_import.LazyImport.__call__\n    return self.get_object()(*args, **kwds)\n  File \"sage/misc/lazy_import.pyx\", line 225, in sage.misc.lazy_import.LazyImport.get_object\n    return self._get_object()\n  File \"sage/misc/lazy_import.pyx\", line 262, in sage.misc.lazy_import.LazyImport._get_object\n    self._object = getattr(__import__(self._module, {}, {}, [self._name]), self._name)\n  File \"/ext/sage/10.1/src/sage/interfaces/maxima_lib.py\", line 137, in <module>\n    ecl_eval(\"(set-locale-subdir)\")\n  File \"sage/libs/ecl.pyx\", line 1350, in sage.libs.ecl.ecl_eval\n    cpdef EclObject ecl_eval(str s):\n  File \"sage/libs/ecl.pyx\", line 1373, in sage.libs.ecl.ecl_eval\n    o=ecl_safe_eval(python_to_ecl(s, True))\n  File \"sage/libs/ecl.pyx\", line 321, in sage.libs.ecl.ecl_safe_eval\n    raise RuntimeError(\"ECL says: {}\".format(message))\nRuntimeError: ECL says: The function SET-LOCALE-SUBDIR is undefined.\n"}︡{"done":true}︡
︠b06bf6b9-826d-4e07-a6ff-8147ca43b35cs︠
︡5c4424ce-73a2-402f-8dde-2ef8dd4f6b57︡{"done":true}
︠83e1a7b7-868a-4e3f-bf51-28b5ec20422ds︠
##BERLEKAMP

berlekamp_massey([1, 1, 2, 3, 8, 11, 34, 39, 148, 127])
︡99bed5cf-f70a-4ec5-891b-baff654a9913︡{"stdout":"x^3 - 5*x + 2\n"}︡{"done":true}
︠48d75444-9784-433a-9f95-964f54d9d85cs︠


Q1= x^18 + 3*x^17 + 5*x^16 + 12*x^15 + 11*x^14 + x^13 + 16*x^12 + 16*x^11 + 8*x^10+4*x^9+13*x^8+16*x^7+4*x^6+8*x^5+1*x^4+10*x^3+9*x^2+3*x^1+13


gcd(Q1,Q1.derivative())
gcd(Q1,x^4 - x)
gcd(Q1,x^8 - x)
gcd(Q1,x^16 - x)
︡f6fdd668-b88c-46b4-b8cf-6fb426eab55e︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"done":true}
︠003cbcf1-3924-44e7-8a30-9bdbf927863es︠

︡6940d53f-d4cb-406f-920f-416ba79ba42b︡{"done":true}
︠10bad3a2-ba84-481b-af6b-d51270f5a265s︠
var('x y')
g = x^2 + 2*y^2 -3
h = x^2 + x*y + y^2 - 3
g-h

︡64162ac9-c0da-4dc5-849e-1af6dd1d7e17︡{"stdout":"(x, y)\n"}︡{"stdout":"-x*y + y^2\n"}︡{"done":true}
︠fd9c26be-89b9-44b7-bad3-84661c398cc1s︠

A.<x, y> = PolynomialRing(RationalField(), 2, order='deglex')
I = ( f1 , f2 )* A
G = I.groebner_basis()
print(G)
B.<a,b>=A.quotient(I)
print(B)

︡faca935e-8f90-4496-89a6-fbdadfa5de8f︡{"stdout":"[y^3 - y, x^2 + 2*y^2 - 3, x*y - y^2]\n"}︡{"stdout":"Quotient of Multivariate Polynomial Ring in x, y over Rational Field by the ideal (x^2 + 2*y^2 - 3, x^2 + x*y + y^2 - 3)\n"}︡{"done":true}
︠35e16bea-c046-42f0-8ced-68a11f23072ds︠
x, y = var('x, y')
solve([y^3-y==0, x^2 + 2*y^2 - 3==0, x*y - y^2==0], x, y)
#solve([x^2 + 2*y^2 == 3, x^2 + x*y + y^2 == 3 ], x,y)
︡fa8506b8-4cc3-4604-8bdd-230b316bc758︡{"stderr":"Error in lines 2-2\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"/ext/sage/10.1/src/sage/symbolic/relation.py\", line 1135, in solve\n    m = maxima(f)\n        ^^^^^^^^^\n  File \"sage/misc/lazy_import.pyx\", line 409, in sage.misc.lazy_import.LazyImport.__call__\n    return self.get_object()(*args, **kwds)\n  File \"sage/misc/lazy_import.pyx\", line 225, in sage.misc.lazy_import.LazyImport.get_object\n    return self._get_object()\n  File \"sage/misc/lazy_import.pyx\", line 262, in sage.misc.lazy_import.LazyImport._get_object\n    self._object = getattr(__import__(self._module, {}, {}, [self._name]), self._name)\n  File \"/ext/sage/10.1/src/sage/interfaces/maxima_lib.py\", line 137, in <module>\n    ecl_eval(\"(set-locale-subdir)\")\n  File \"sage/libs/ecl.pyx\", line 1350, in sage.libs.ecl.ecl_eval\n    cpdef EclObject ecl_eval(str s):\n  File \"sage/libs/ecl.pyx\", line 1373, in sage.libs.ecl.ecl_eval\n    o=ecl_safe_eval(python_to_ecl(s, True))\n  File \"sage/libs/ecl.pyx\", line 321, in sage.libs.ecl.ecl_safe_eval\n    raise RuntimeError(\"ECL says: {}\".format(message))\nRuntimeError: ECL says: The function SET-LOCALE-SUBDIR is undefined.\n"}︡{"done":true}︡
︠6b1c0f8b-cb4b-4aa4-9f1b-901cba90c7e3s︠

######## HERMITE (page 34)
var('x')
Qx.<x> = PolynomialRing(QQ)
f = 0 + (x-1)*(-5) + 5 *((x-1)^2) + 10 *((x-1)^3)/6
g = 16 + (x-2)*60
h = (x-1)^4
l =  (x-2)^2

result = crt([f, g], [h,l])

result
︡de54595e-b614-4573-84c1-15292375e80a︡{"stdout":"x\n"}︡{"stdout":"-22/3*x^5 + 175/3*x^4 - 475/3*x^3 + 610/3*x^2 - 400/3*x + 112/3\n"}︡{"done":true}
︠e6653a2c-c352-428e-8c2d-7969c4102c1bs︠
from sage.all import *
var('x')

def Hermite1(l):
    a, b = l[0], l[1]
    r = len(b) -1

    # Définir le polynôme de base
    Ax.<x> = PolynomialRing(QQ)
    P = 0

    # Calculer les termes du polynôme d'Hermite
    for i in range(r + 1):
        P += ((b[i] * (x - a)^i) / factorial(i))

    P
    return P % (x-a)^(r + 1)

# Exemple d'utilisation
l = [2, [11, 45]]  # Remplacez ces valeurs par celles de votre choix
#result = Hermite1(l)
#print(result)

︡6c7b2b80-b5cd-4736-8a65-da9daa1c0564︡{"stdout":"x\n"}︡{"done":true}
︠4690b38e-9f2f-4f90-9675-41bbbc09c1b2s︠
q = -3*(x-1) + (x-1)^2 + 7*(x-1)^3
mod = (x - 1)^4

def HermiteModuli(l):
    a, b = l[0], l[1]
    r = len(b) - 1
    return (x - a)^(r + 1)

def Hermite(points):
    # Initialiser les listes
    a_list = [point[0] for point in points]
    print(a_list)
    b_list = [point[1] for point in points]
    print(b_list)

    az = len(points)

    # Construire les polynômes Hermite1 pour chaque paire [ai, bi]
    polynomials = [Hermite1([a_list[i], b_list[i]]) for i in range(0,az)]

    # Construire la liste des moduli en fonction de a_list et de la longueur des listes b_list
    moduli = [HermiteModuli([a_list[i], b_list[i]]) for i in range(0, az)]
    print(moduli)
    moduli_polys = [moduli[i].polynomial(QQ) for i in range(0, az)]
    print(moduli_polys)

    # Utiliser la fonction crt avec les listes de polynômes et de moduli
    result = crt(polynomials, moduli_polys)

    return result

Hermite([[1, [0, -5, 10, 60]],[2, [16, 60]]])


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

listeCarmi(20)
︡13186a7f-f937-422c-9192-6e997d572cc5︡{"stdout":"[1, 2]\n[[0, -5, 10, 60], [16, 60]]\n[(x - 1)^4, (x - 2)^2]\n[x^4 - 4*x^3 + 6*x^2 - 4*x + 1, x^2 - 4*x + 4]\nx^5 - 5*x^2 + 4\n"}︡{"stdout":"False\n"}︡{"stdout":"[561, 1105, 1729, 2465, 2821, 6601, 8911, 10585, 15841, 29341, 41041, 46657, 52633, 62745, 63973, 75361, 101101, 115921, 126217, 162401]"}︡{"stdout":"\n"}︡{"done":true}
︠2becee5e-4eea-44a2-b67c-fb1c0733382cs︠

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

def test(n, k):
    result = true
    for i in range(k):
        value = randrange(1, n-1)
        result = result and testFermat(n, value)
    return result

test(10 + 67, 10)
︡4d632dcb-ef84-4df9-8aa6-8a4d2dfcc699︡{"stdout":"ptetre n est premier\n"}︡{"stdout":"n est composé\n"}︡{"done":true}
︠019974b1-ea37-4725-8f3f-5ec6240a0cf8s︠

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



n = 546421
is_mersenne_prime(31)
if (is_prime(n) == false):
    print(factor(n))

︡7b38d458-9d45-4275-9d27-c29740855f8b︡{"stdout":"True\n"}︡{"stdout":"19 * 28759\n"}︡{"done":true}
︠bb5a6fcf-f960-4e65-8c79-3945e2104b67︠

def racines(P):
    D = gcd(x^11 - x,P)
    return degreesEfaux(D,1)

P=x^8 + 8*x^6 + 9*x^4 + 6*x^2 + 4
D = gcd(x^11 - x,P); D
#racines(P)
#marche pas car ici gcd == 1
︡5a5d9dd8-2063-4167-92e2-59f74352b515︡{"stdout":"1\n"}︡{"done":true}
︠73f0a6d9-b74d-4e79-b3b6-90b6f4c95cdds︠

#### DSI Multieval
from sage.rings.polynomial.polynomial_ring_constructor import PolynomialRing
from sage.rings.polynomial.polynomial_element import Polynomial

def PolyMij(n, u):
    M0j = [x - u[j] for j in range(n)]
    M = [M0j]
    k = valuation(n, 2)
    for i in range(k - 1):
        Mi = [(M[i][2 * j]) * (M[i][2 * j + 1]) for j in range(2^(k - i - 1))]
        M = M + [Mi]
    return M

def Multieval(n, P, M):
    if n == 1:
        return [P]
    k = valuation(n, 2)
    m = n // 2
    P0 = P % PolynomialRing(QQ, 'x')(M[k - 1][0])
    P1 = P % PolynomialRing(QQ, 'x')(M[k - 1][1])
    M0 = []
    M1 = []
    for i in range(0, k - 1):
        M0i = [[M[i][j] for j in range(2^(k - i - 1))]]
        M1i = [[M[i][j] for j in range(2^(k - i - 1), 2^(k - i))]]
        M0 = M0 + M0i
        M1 = M1 + M1i
    return Multieval(m, P0, M0) + Multieval(m, P1, M1)

# Tester avec n = 4 et u = [1, 2, 3, 4]
n = 4
u = [1, 2, 3, 4]
M = PolyMij(n, u)

# Définir le polynôme P comme x^2 + 2x + 1
P = PolynomialRing(QQ, 'x').gen()
P = P^2 + 2*P + 1

results = Multieval(n, P, M)
print("PolyMij Result:")
print(M)
print("\nMultieval Result:")
print(results)

︡a271c897-e63c-4f10-a406-4f59be8edb5c︡{"stderr":"Error in lines 31-31\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 6, in Multieval\n  File \"sage/structure/parent.pyx\", line 901, in sage.structure.parent.Parent.__call__\n    return mor._call_(x)\n  File \"sage/structure/coerce_maps.pyx\", line 289, in sage.structure.coerce_maps.NamedConvertMap._call_\n    cdef Element e = method(C)\n  File \"sage/symbolic/expression.pyx\", line 7761, in sage.symbolic.expression.Expression._polynomial_\n    return self.polynomial(None, ring=R)\n  File \"sage/symbolic/expression.pyx\", line 7635, in sage.symbolic.expression.Expression.polynomial\n    from sage.symbolic.expression_conversions import polynomial\n  File \"/ext/sage/10.1/src/sage/symbolic/expression_conversions.py\", line 943, in <module>\n    sympy_converter = SympyConverter()\n                      ^^^^^^^^^^^^^^^^\n  File \"/ext/sage/10.1/src/sage/symbolic/expression_conversions.py\", line 694, in __init__\n    sympy_init()\n  File \"/ext/sage/10.1/src/sage/misc/misc.py\", line 1167, in wrapper\n    result = func(*args, **kwargs)\n             ^^^^^^^^^^^^^^^^^^^^^\n  File \"/ext/sage/10.1/src/sage/interfaces/sympy.py\", line 1108, in sympy_init\n    sympy.core.function._undef_sage_helper = UndefSageHelper()\n    ^^^^^^^^^^\nAttributeError: module 'sympy' has no attribute 'core'\n"}︡{"done":true}︡
︠dbc9848b-dfbc-422d-8bc1-24cb2f1f0cebs︠

︡07c73cc6-4037-4543-80a1-3f812aa6d5a8︡{"done":true}
︠31b0d1ff-9512-4fed-a9d7-ef66a5a5e650s︠

def list_quo_rem(p, L):
    r = p
    quo = []
    for q in L:
        Q, R = r.quo_rem(q)
        quo.append(Q)
        r = R
    return (quo, r)

R.<x,y> = PolynomialRing(QQ, order="lex")
p = x*y^2-x
q = x*y+1
r = y^2-1

list_quo_rem(p, [q, r])
list_quo_rem(p, [r, q])
︡707b2403-d075-4b94-8af3-7340af2d73f0︡{"stdout":"([y, 0], -x - y)\n"}︡{"stdout":"([x, 0], 0)\n"}︡{"done":true}
︠85300e21-8ad9-4cff-8067-d3148bb01e37︠

def FFT(n, w, P):
    if n == 1:
        return P
    m = n // 2
    P0 = [P[2 * i] for i in range(m)]
    P1 = [P[2 * i + 1] for i in range(m)]
    L0 = FFT(m, w^2, P0)
    L1 = FFT(m, w^2, P1)
    R0 = [L0[i] + w^i * L1[i] for i in range(m)]
    R1 = [L0[i] - w^i * L1[i] for i in range(m)]
    return R0 + R1




### inversion modulaire
def Inverse2(F,n):
    A=1
    k=1
    while k<n:
        k=2*k
        F_red=F % (x^k)
        A2=(A^2) % (x^k)

        FA2=(F_red*A2) % (x^k)
        A=2*A-FA2
    return A % (x^n)

G0 = 3*x^2 + 2*x + 1

#Inverse2(G0,5)
︡e6add32d-089d-4303-b36e-5a8021a06533︡{"stderr":"Error in lines 23-23\nTraceback (most recent call last):\n  File \"sage/structure/element.pyx\", line 1964, in sage.structure.element.Element._mod_\n    python_op = (<object>self)._mod_\n  File \"sage/structure/element.pyx\", line 488, in sage.structure.element.Element.__getattr__\n    return self.getattr_from_category(name)\n  File \"sage/structure/element.pyx\", line 501, in sage.structure.element.Element.getattr_from_category\n    return getattr_from_other_class(self, cls, name)\n  File \"sage/cpython/getattr.pyx\", line 362, in sage.cpython.getattr.getattr_from_other_class\n    raise AttributeError(dummy_error_message)\nAttributeError: 'sage.symbolic.ring.SymbolicRing' object has no attribute '__custom_name'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 6, in Inverse2\n  File \"sage/structure/element.pyx\", line 1931, in sage.structure.element.Element.__mod__\n    return (<Element>left)._mod_(right)\n  File \"sage/structure/element.pyx\", line 1966, in sage.structure.element.Element._mod_\n    raise bin_op_exception('%', self, other)\nTypeError: unsupported operand parent(s) for %: 'Symbolic Ring' and 'Symbolic Ring'\n"}︡{"done":true}
︠86df35d3-73bb-4789-bbd4-685cb061e4afs︠
###division rapide
#def Division(kx,F,G):
#    m,n=F.degree(),G.degree()
#    if m<n:
#        return (0,F)
#    else:
#        G1=rev(kx,n,G)
#        G1=Inverse2(G1/G1(0),m-n+1)/G1(0)
#        Q1=(rev(kx,m,F)*G1)%x^(m-n+1)
#        Q=rev(kx,m-n,Q1)
#    return Q,F-G*Q



from sage.all import *

# Définir l'anneau polynomial
A.<x, y> = PolynomialRing(RationalField(), 2, order='deglex')
I = ( f1 , f2 )* A
G = I.groebner_basis()
B.<a,b>=A.quotient(I)
print(B)
var('x y')
g = x^2 + 2*y^2 -3
h = x^2 + x*y + y^2 - 3

# Définir un idéal avec quelques polynômes


# Calculer la base de Gröbner réduite
groebner_basis_I = I.groebner_basis()

# Afficher les monômes standards de la base de Gröbner réduite
standard_monomials = [poly.lt() for poly in groebner_basis_I]
print("Monômes standards de la base de Gröbner réduite:", standard_monomials)
︡64c6c205-d9ca-4bad-b587-a401ab9ca8bc︡{"stdout":"Quotient of Multivariate Polynomial Ring in x, y over Rational Field by the ideal (x^2 + 2*y^2 - 3, x^2 + x*y + y^2 - 3)\n"}︡{"stdout":"(x, y)\n"}︡{"stdout":"Monômes standards de la base de Gröbner réduite: [y^3, x^2, x*y]\n"}︡{"done":true}
︠78bbf746-4a36-4a75-86d4-c4a7a633bee1︠









