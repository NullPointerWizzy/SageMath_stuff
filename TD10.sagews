︠55a25794-c2c2-4d9a-a694-d01b99174964s︠

q = 17
k.<a> = GF(q)
#Q= PolynomialRing(QQ,x)
kx.<x> = PolynomialRing(GF(17))

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
c = cyclotomic_polynomial(16)
cantorZassenhaus(5,Q1)


########################################
#k.<a> = GF(q)
#Q = PolynomialRing(QQ, x)
#kx.<x> = PolynomialRing(k)

P =x^3 + x^2 + x + 1

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

P= x^8 + 8*x^6 + 9*x^4 + 6*x^2 + 4
#degreesEfaux(Q, 6)

︡c0e39f5a-ca59-4117-b640-0e5b36197631︡{"stdout":"'echec'\n"}︡{"done":true}
︠dc9028f1-9c7b-4d82-9d88-547c6402286cs︠

P=x^11 + 3*x^10 + 2*x^9 + 3*x^8 + x^7 + x^5 + 3*x^4 + 2*x^2 + 4*x
P/x
P/x+4
D2 = gcd(x^(25) - x,P); D2
degreesEfaux(D2,1)
︡bd9363e6-4ee3-4150-9546-a4ca13cb74e2︡{"stdout":"x^10 + 3*x^9 + 2*x^8 + 3*x^7 + x^6 + x^4 + 3*x^3 + 2*x + 4\n"}︡{"stdout":"x^10 + 3*x^9 + 2*x^8 + 3*x^7 + x^6 + x^4 + 3*x^3 + 2*x + 8\n"}︡{"stdout":"x\n"}︡{"stdout":"[x]\n"}︡{"done":true}
︠3a586b2c-51c9-492b-abf9-4f66a61a4454︠

def racines(P):
    D = gcd(x^11 - x,P)
    return degreesEfaux(D,1)

P=x^8 + 8*x^6 + 9*x^4 + 6*x^2 + 4
D = gcd(x^11 - x,P); D
racines(P)
︡2cb794a1-2b11-4ab0-a180-7756b6805beb︡{"stdout":"1\n"}︡{"done":true}
︠4179fc55-ef48-4f7f-b0ae-5769b62162ads︠


#####MATRICES
MF3=MatrixSpace(GF(3),3,3)
M=MF3([1,2,0,1,0,1,2,2,1]);M
A=matrix(QQ,6,6,lambda i,j:i+j); A
KerM=M.right_kernel(); KerM
KerM.basis()
lol =KerM.random_element();lol
MF3(1)
︡eb8dfe0f-0670-4be3-9ba6-1b8596cb8f66︡{"stdout":"[1 2 0]\n[1 0 1]\n[2 2 1]\n"}︡{"stdout":"[ 0  1  2  3  4  5]\n[ 1  2  3  4  5  6]\n[ 2  3  4  5  6  7]\n[ 3  4  5  6  7  8]\n[ 4  5  6  7  8  9]\n[ 5  6  7  8  9 10]\n"}︡{"stdout":"Vector space of degree 3 and dimension 1 over Finite Field of size 3\nBasis matrix:\n[1 1 2]\n"}︡{"stdout":"[\n(1, 1, 2)\n]\n"}︡{"stdout":"(0, 0, 0)"}︡{"stdout":"\n"}︡{"stdout":"[1 0 0]\n[0 1 0]\n[0 0 1]\n"}︡{"done":true}︡
︠5e6f6ba8-6896-4ae8-807b-9fd07754ce82s︠

#### EXO 7
f = x^6 + 2*x^5 + x^4 + 2*x^3 + x - 1
fD = f.derivative(); fD
question1 = gcd(fD,f); question1

question2 = gcd(f,x^5 - x); question2

#question3 d'apres l'exo 4 et 5 on a pas de facteur de degré 5 donc pas de degré 1
#donc on peut factoriser seulement en utilisant le theoreme chinois en des produits de
#degrés 2, 3 ou 4
MF5=MatrixSpace(PolynomialRing(GF(5)),5,5)
Id=MF5(1);Id
def F(x):
    return x^5

︡7f93ef1d-0eaf-4adc-9a01-402802c4c2ad︡{"stdout":"6*x^5 + 10*x^4 + 4*x^3 + 6*x^2 + 1\n"}︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"stderr":"Error in lines 5-5\nTraceback (most recent call last):\n  File \"/ext/sage/10.1/src/sage/rings/polynomial/polynomial_ring_constructor.py\", line 696, in PolynomialRing\n    names = kwds.pop(\"names\")\n            ^^^^^^^^^^^^^^^^^\nKeyError: 'names'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"/ext/sage/10.1/src/sage/rings/polynomial/polynomial_ring_constructor.py\", line 698, in PolynomialRing\n    raise TypeError(\"you must specify the names of the variables\")\nTypeError: you must specify the names of the variables\n"}︡{"done":true}
︠b295832b-9188-459c-b4e1-5914375ebf75︠


#F = MF5([x^5,0,0,0,0,0,x^5,0,0,0,0,0,x^5,0,0,0,0,0,x^5,0,0,0,0,0,x^5])

def interpolation_lagrange(xm, ym, x):
    Lx=0
    wx = [ ['_' for i in range(len(ym))] for j in range(len(xm))]
    li = [1] * len(ym)

    for i in range(len(ym)):
        for j in range(len(xm)):
            if i != j:
                wx[i][j]=(x -xm[j])/(xm[i]-xm[j])
                li[i]=li[i]*wx[i][j]
        Lx = Lx + li[i]*ym[i]
        
    return {'matrice_poids':wx, 'li(x)': li, 'L(x)':Lx}

resultat = interpolation_lagrange([1,2,3], [0.5, 2, 4.5], 1.5)
print(resultat)
︡14c7ef6e-c08b-4859-bef7-332e3427bbe5︡{"stdout":"[['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']]\n"}︡{"stdout":"{'matrice_poids': [['_', 0.500000000000000, 0.750000000000000], [0.500000000000000, '_', 1.50000000000000], [0.250000000000000, -0.500000000000000, '_']], 'li(x)': [0.375000000000000, 0.750000000000000, -0.125000000000000], 'L(x)': 1.12500000000000}\n"}︡{"done":true}
︠d448e8ef-3127-472e-aa53-896d2e122de5︠

︡27bee3df-fc1b-46a9-b70f-40812cfb362b︡
︠56d1e0c2-445e-46b7-90a6-8b64609f81e6s︠

q = 17
k.<a> = GF(q)
Q= PolynomialRing(QQ,x)
#kx.<x> = PolynomialRing(GF(11))

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


Q= x^18 + 3*x^17 + 5*x^16 + 12*x^15 + 11*x^14 + x^13 + 16*x^12 + 16*x^11 + 8*x^10+4*x^9+13*x^8+16*x^7+4*x^6+8*x^5+1*x^4+10*x^3+9*x^2+3*x^1+13
cantorZassenhaus(5,Q)
︡f2c20619-4e6d-4086-b737-6a36a5552f12︡{"stdout":"x + 10\n"}︡{"done":true}
︠110bfa21-107d-4fd6-8885-7c38a61847be︠









