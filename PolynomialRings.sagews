︠58fe5e8a-170d-4d83-b055-337f1ed94587s︠
Zx.<x>=PolynomialRing(IntegerModRing(13))

def FFT2(n,w,P):
    size = len(list(P))

    if n == 1:
        return P
    P0 = [P[i] for i in range (size) if i%2 ==0]
    P1 = [P[i] for i in range (size) if i%2 ==1]

    L0 = FFT2(n//2,w^2,P0)
    L1 = FFT2(n//2, w^2,P1)
   

    R = [0] *n

    for i in range ((n/2)):
        print(L0)
        print(L1)
        R[i] = L0[i] + w^i*L1[i]
        R[i + (n//2)] = L0[i] - w^i*L1[i]

    return R

P = x^3 - 2*x^2 + 2*x + 3
Q = x^3 + 2*x^2 + 3*x - 1
FFT2(4,2^3,[3,2,-2,1])
︡9a4681a4-0d82-4a8b-9770-6c3bc301cb2d︡{"stdout":"[3]\n[-2]\n[2]\n[1]\n[1, 5]\n[3, 1]\n[1, 5]\n[3, 1]\n[4, 13, -2, -3]\n"}︡{"done":true}
︠a61b98ea-c380-4098-8d09-70b8d1becc67s︠
from sage.symbolic.constants import I
Cx.<x>=PolynomialRing(CC)
Cring = CC

def prodFFT(P, Q, n):
    w = e^((2*I*pi)/n)
    Rp = FFT(n, w, P)
    Rq = FFT(n, w, Q)

    R = [0]*n

    for i in range(n):
        R[i] = Rp[i] * Rq[i]

    invN = Cring(n^(-1))
    R = [R[i] * invN for i in range(n)]
    return FFT(n,w.inverse(),R)


P = x^3 + 2*x^2 + 3*x - 1

prodFFT(P,P,8)
︡64025b9b-4652-4340-b9f7-0cc3a31daa05︡{"stderr":"Error in lines 15-15\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 3, in prodFFT\n  File \"\", line 7, in FFT\n  File \"\", line 7, in FFT\n  File \"\", line 11, in FFT\nIndexError: list index out of range\n"}︡{"done":true}
︠114924bc-f687-499a-a568-e26e537be953s︠

M = matrix(5, 5, [1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,-1,1,-1,1,16,8,4,2,1])
Mp = matrix(5, 5, [1,0,0,0,0,-2,1/2,-1/2,-1/6,1/6,-1,-1,1/2,1/2,0,2,-1/2,1,-1/3,-1/6,0,1,0,0,0])

print(M)
print(Mp)
print(M*Mp)
︡f882250a-c304-43f5-aefe-c242a1d6c8a3︡{"stdout":"[ 1  0  0  0  0]\n[ 0  0  0  0  1]\n[ 1  1  1  1  1]\n[ 1 -1  1 -1  1]\n[16  8  4  2  1]\n"}︡{"stdout":"[   1    0    0    0    0]\n[  -2  1/2 -1/2 -1/6  1/6]\n[  -1   -1  1/2  1/2    0]\n[   2 -1/2    1 -1/3 -1/6]\n[   0    1    0    0    0]\n"}︡{"stdout":"[1 0 0 0 0]\n[0 1 0 0 0]\n[0 0 1 0 0]\n[0 0 0 1 0]\n[0 0 0 0 1]\n"}︡{"done":true}
︠55530e0f-efb2-453b-8343-cc27cc41c0d0︠
Zx.<x>=PolynomialRing(ZZ)


p = [-1,1,3]
q = [1, -2, 1]
P = Zx(p)
Q = Zx(q)


︡55040763-ab48-40c3-afb3-b5c78ed188f8︡{"stdout":"-1\n"}︡{"stdout":"0\n"}︡{"stdout":"4\n"}︡{"stdout":"13\n"}︡{"stdout":"3*x^4 - 5*x^3 + 3*x - 1\n"}︡{"done":true}
︠6de057c8-2fcf-4365-a9b7-773b0ed572f1︠

def evaluationPolynomials(eval, p, q):
    a = p(eval)
    b = q(eval)
    return a*b

evaluationPolynomials(0,P,Q)
evaluationPolynomials(1,P,Q)
evaluationPolynomials(-1,P,Q)
evaluationPolynomials(2,P,Q)
︡bebc7d62-5dbb-4555-8f03-91b54cadd16e︡
︠0715dd18-6ea1-4fce-aacc-85e807e4f472s︠
Mp = matrix(5, 5, [1,0,0,0,0,-2,1/2,-1/2,-1/6,1/6,-1,-1,1/2,1/2,0,2,-1/2,1,-1/3,-1/6,0,1,0,0,0])
print(Mp*vector([3,-1,0,4,13]))
︡f161d233-f06c-4b43-8990-686974b5a302︡{"stdout":"(3, -5, 0, 3, -1)\n"}︡{"done":true}
︠c670bbd8-e7e8-46bf-a004-48dc96bc1284s︠
l = [-1,3,0,-5,3]
R = Zx(l)
print(R)
︡35fc4b26-1d6b-4626-a04e-a33e20a330ba︡{"stdout":"3*x^4 - 5*x^3 + 3*x - 1\n"}︡{"done":true}
︠684a93f8-1fed-4382-9d62-7263f4f808c0︠
#correction produit

def Produit(n,P,Q):
    m0=len(P)
    n0=len(Q)
    P0=P+[0 for i in range(n-m0)]
    Q0=Q+[0 for i in range(n-n0)]
    w=e^(2*I*pi/n)
    ZP=FFT2(n,w,P0)
    ZQ=FFT2(n,w,Q0)
    Z=[ZP[i]*ZQ[i] for i in range(n)]
    prod = FFT2(n,w^(-1),Z)
    return [(prod[i]/n).trig_simplify() for i in range(n)]
    #num approx et simplify pour avoir un resultat plus joli sinon c abominale

Produit(8,[1,2,4],[4,3,5])
︡f71f4c00-8d3e-47cd-9be9-9e3d12296afb︡{"stdout":"[4, 11, 27, 22, 20, 0, 0, 0]"}︡{"stdout":"\n"}︡{"done":true}
︠9a78b5aa-a7d0-48f7-b9f7-4cea1b1eeb3bs︠

FFT2(4,1,[4,3,2,1])
︡2b16a52e-3c9c-43eb-a208-476c5cc1a935︡{"stdout":"[10, 4, 2, 0]\n"}︡{"done":true}
︠383d5563-d8e7-449c-9b14-c45ab7bfff6b︠









