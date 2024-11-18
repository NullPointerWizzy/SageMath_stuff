︠cde1ff18-1cef-41a1-9a29-f9522fd8e873︠
#                   TD3 Calcul Formel

#EXERCICE 1
︡b55c087a-8d43-4786-973a-82c51c8cac8c︡
︠07f910d6-0a81-4703-9028-1c16f91914eb︠
Zx.<x>=PolynomialRing(ZZ)
p=9*x^3+2*x-1
parent(p)
factor(p)
p.coefficients()
p(x=1/3)
p[1]
p.degree()
[p[i] for i in range(4)]
p[9]
︡824a0814-a510-465e-8ce3-389eb3cb59d3︡{"stdout":"Univariate Polynomial Ring in x over Integer Ring\n"}︡{"stdout":"(3*x - 1) * (3*x^2 + x + 1)\n"}︡{"stdout":"[-1, 2, 9]\n"}︡{"stdout":"0\n"}︡{"stdout":"2\n"}︡{"stdout":"3\n"}︡{"stdout":"[-1, 2, 0, 9]\n"}︡{"stdout":"0\n"}︡{"done":true}
︠0cddea15-53ee-46af-8014-444978439268︠
p[0]
︡702334d3-ee31-4d06-aa57-77a10c4db7f0︡{"stdout":"-1\n"}︡{"done":true}
︠184c92b3-16c1-43db-be0a-e4152120efa6︠
L=[0,1,2,3,4,5,0,0]
l=[3,4,2,4]
q=Zx(L);q
p=Zx(l);p
#cree un polynome a partir de la liste L avec des coeff dans Z
p*q
︡b9891a54-5779-43ac-b0a0-7df9e3bf5d24︡{"stdout":"5*x^5 + 4*x^4 + 3*x^3 + 2*x^2 + x\n"}︡{"stdout":"4*x^3 + 2*x^2 + 4*x + 3\n"}︡{"stdout":"20*x^8 + 26*x^7 + 40*x^6 + 45*x^5 + 32*x^4 + 19*x^3 + 10*x^2 + 3*x\n"}︡{"done":true}
︠18ba356d-7424-4c08-a510-a7d518381302︠
Zx.random_element((0,100),-100,100)
︡2f61e4a9-8f5f-49a6-819d-978e4fc7bc93︡{"stdout":"-70*x^61 + 54*x^60 + 83*x^59 + 34*x^58 + 60*x^57 + 6*x^56 + 40*x^55 - 81*x^54 + 86*x^53 - 87*x^52 - 6*x^51 - 32*x^50 - 32*x^48 - 22*x^47 - 87*x^46 + 19*x^45 - 55*x^44 - 92*x^43 - 32*x^42 + 31*x^41 - 56*x^40 - 40*x^39 - 28*x^38 - 97*x^37 - 92*x^36 + 63*x^35 - x^34 + 52*x^33 + 37*x^32 + 24*x^31 + 40*x^30 + 33*x^29 + 31*x^28 - 17*x^27 + 88*x^26 - 46*x^25 + 61*x^24 - x^23 + 71*x^22 - 32*x^21 + 66*x^20 - 16*x^19 - 3*x^18 + 64*x^17 - 51*x^16 - 31*x^15 + 78*x^14 + 81*x^13 - 21*x^12 - 87*x^11 - 8*x^10 + 60*x^9 - 78*x^8 + 6*x^7 + 75*x^6 - 63*x^5 + 68*x^4 - 66*x^3 + 48*x^2 + 6*x + 69\n"}︡{"done":true}
︠854e23ff-72b4-4f51-9777-4e06b65ac7dcs︠
Qx.<x>=PolynomialRing(QQ)
Qx.random_element((0,10),num_bound=10,den_bound=10)
︡e4cdeff4-9511-4427-b353-7c659f282295︡{"stdout":"1/5*x^2 + 6*x - 9/2\n"}︡{"done":true}︡
︠42bde06d-190e-4ba4-928a-34f2ada650c0s︠
#EXERCICE 2

#EXERCICE 2

def Karatsuba(n, P, Q):
    if n == 1:
        return [P[0] * Q[0], 0]

    m = n // 2

    P0 = P[:m]
    P1 = P[m:]
    Q0 = Q[:m]
    Q1 = Q[m:]
    SP = [P0[i] + P1[i] for i in range(m)]
    SQ = [Q0[i] + Q1[i] for i in range(m)]

    R0 = Karatsuba(m, P0, Q0)
    R2 = Karatsuba(m, P1, Q1)
    S = Karatsuba(m, SP, SQ)

    # Calculate R1
    R1 = [S[i]-R0[i]-R2[i] for i in range(n)]

    # Combine the results
    resultat = R0+R2
    for i in range(n) :
        resultat[i+m] = resultat[i+m] + R1[i]
    return resultat

# Example usage
P = [3,1,2,0]
Q = [4,0,0,3]

result = Karatsuba(4, P, Q)
print(result)

︡746ca149-9f4a-4190-950c-e483ed337c33︡{"stdout":"[12, 4, 8, 9, 3, 6, 0, 0]\n"}︡{"done":true}
︠12a80e80-e322-4fd9-ac0a-a19242636c65s︠
Qx.<x>=PolynomialRing(QQ)
A = Qx.random_element(100,100,100)
B = Qx.random_element(100,100,100)
Qx(Karatsuba(128,A,B))-A*B
︡58681310-ee49-4bc7-ade0-11bcfdd8ff62︡{"stderr":"Error in lines 4-4\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.11/site-packages/smc_sagews/sage_server.py\", line 1244, in execute\n    exec(\n  File \"\", line 1, in <module>\n  File \"\", line 6, in Karatsuba\n  File \"sage/rings/polynomial/polynomial_element.pyx\", line 1155, in sage.rings.polynomial.polynomial_element.Polynomial.__getitem__\n    raise IndexError(\"polynomial slicing with a start is not defined\")\nIndexError: polynomial slicing with a start is not defined\n"}︡{"done":true}
︠829f3fa2-2cf9-41cf-9957-617013ed9b38s︠
a = 7
a.quo_rem(3)
︡bddfd77c-6249-4176-8096-ea5b71e4a666︡{"stdout":"(2, 1)\n"}︡{"done":true}
︠1cd2accd-ba45-49c5-a35e-c9a230abb872s︠
#EXERCICE 3
import random

def randList(n):
    return random.sample(range(n),n)

randList(20)
︡96154ef1-8003-41af-b25c-5f146c212806︡{"stdout":"[12, 5, 18, 13, 3, 1, 8, 0, 14, 7, 9, 19, 2, 15, 17, 4, 10, 16, 11, 6]\n"}︡{"done":true}
︠4310798d-6654-403b-baf0-d4b56ca764cds︠

def division(l):
    n = len(l)
    q1 = l[:ceil(n/2)]
    q2 = l[floor(n/2):]
    return q1,q2

division([2,1,3,3,4,2,2,2,22,1,2])
︡5ad76dcf-100d-4dc0-8aff-edab4c425f7d︡{"stdout":"([2, 1, 3, 3, 4, 2], [2, 2, 2, 22, 1, 2])\n"}︡{"done":true}
︠85c5dafe-7df1-459b-a8c3-d3861b49cd13s︠
def fusion(p, q):
    if (len(p) == 0 and len(q) != 0):
        return q
    if (len(p) != 0 and len(q) == 0):
        return p
    if (len(p) == 1 and len(q) == 1):
        return [min(p[0],q[0]),max(p[0],q[0])]

    liste = p + q

    for i in range(len(liste)-1):
        for j in range(0, len(liste)-i-1):
            if liste[j] > liste[j + 1]:
                tmp = liste[j]
                liste[j] = liste[j+1]
                liste[j+1] = tmp

    return liste

fusion([2],[1])
︡39f3978a-994e-4077-b736-c3bb16e12c35︡{"stdout":"[1, 2]\n"}︡{"done":true}
︠e0d52e0f-a08b-4d47-865b-0908f9a68fbbs︠
def division(l):
    n = len(l)
    q1 = l[:ceil(n/2)]
    q2 = l[-floor(n/2):]
    return q1,q2

division([3,1,3])

def tri(liste):
    if len(liste) == 1:
        return liste
    p,q = division(liste)
    return fusion(tri(p),tri(q))

tri([2,1,3,0,5])
︡3a8fe8f1-109b-40f0-9438-cee36f3a15bd︡{"stdout":"([3, 1], [3])\n"}︡{"stdout":"[0, 1, 2, 3, 5]\n"}︡{"done":true}
︠06d789e0-7749-424f-a29b-49016ca0c513s︠


def dichotomie(liste, n):
    a = 0
    b = len(liste) - 1
    while a <= b:
        m = (a + b) // 2
        if liste[m] == n:
            return True
        elif liste[m] < n:
            a = m + 1
        else:
            b = m - 1

    return False

dichotomie([0, 1, 2, 4, 5, 6, 43, 5435],6)
︡f1b52241-5fba-4c0e-baa1-43d0fdeba21a︡{"stdout":"True\n"}︡{"done":true}
︠56c6300d-3854-4e6e-b457-92ed5ea0d850s︠
def tri_naif(l):
    R = []
    while len(l) > 0:
        m = l[0]
        for i in range(1,len(l)):
            if l[i] < m:
                m = l[i]
        R += [ m ]
        l.pop( l.index(m))

    return R

import time

L = randList(500)
print(L)
︡e6430400-de97-4c36-913f-515cfefd1540︡{"stdout":"[188, 46, 90, 390, 385, 6, 21, 303, 304, 172, 232, 286, 394, 189, 245, 152, 161, 122, 205, 449, 425, 330, 9, 177, 34, 150, 194, 259, 133, 176, 85, 261, 354, 468, 207, 397, 79, 217, 364, 470, 10, 267, 103, 213, 144, 108, 489, 336, 1, 424, 24, 431, 50, 290, 471, 415, 179, 195, 67, 277, 143, 86, 33, 22, 135, 244, 423, 447, 41, 420, 456, 191, 183, 82, 256, 114, 209, 73, 20, 271, 4, 203, 138, 255, 351, 366, 478, 139, 174, 481, 74, 118, 95, 63, 175, 462, 467, 53, 493, 314, 178, 241, 206, 266, 162, 306, 377, 250, 202, 17, 297, 89, 344, 335, 110, 398, 412, 495, 165, 497, 18, 93, 184, 287, 488, 338, 322, 327, 337, 222, 214, 436, 323, 167, 369, 171, 262, 362, 231, 36, 373, 210, 326, 434, 8, 44, 83, 187, 215, 274, 375, 328, 293, 477, 302, 169, 134, 248, 342, 2, 345, 64, 278, 265, 59, 419, 51, 3, 249, 348, 168, 119, 218, 474, 499, 400, 13, 395, 315, 403, 49, 257, 428, 157, 295, 399, 242, 236, 100, 349, 496, 446, 57, 253, 363, 137, 252, 379, 153, 204, 55, 409, 45, 42, 339, 200, 356, 77, 65, 112, 353, 233, 472, 418, 52, 80, 15, 421, 381, 239, 485, 466, 29, 298, 146, 19, 96, 47, 25, 313, 180, 461, 441, 404, 11, 75, 56, 43, 193, 216, 35, 166, 147, 226, 282, 319, 346, 388, 371, 281, 130, 374, 292, 23, 358, 70, 136, 498, 155, 334, 269, 405, 263, 37, 475, 186, 350, 121, 111, 132, 341, 182, 101, 384, 54, 61, 285, 185, 16, 240, 437, 62, 486, 28, 81, 391, 463, 84, 273, 284, 383, 30, 312, 442, 116, 296, 94, 129, 160, 181, 113, 430, 448, 479, 223, 48, 301, 268, 225, 163, 332, 164, 452, 491, 66, 211, 387, 370, 361, 320, 407, 453, 58, 0, 458, 410, 386, 484, 97, 99, 125, 109, 455, 417, 5, 224, 451, 291, 264, 228, 31, 414, 392, 490, 235, 402, 457, 309, 105, 39, 260, 347, 219, 476, 230, 145, 212, 272, 229, 426, 307, 443, 92, 294, 300, 487, 352, 480, 40, 12, 343, 283, 38, 190, 127, 321, 141, 289, 237, 325, 68, 367, 98, 279, 126, 378, 170, 107, 106, 192, 208, 246, 494, 413, 318, 396, 429, 148, 71, 444, 159, 120, 340, 72, 435, 104, 140, 154, 440, 151, 393, 115, 382, 406, 329, 422, 357, 270, 198, 355, 438, 331, 316, 247, 149, 158, 243, 389, 376, 411, 380, 221, 439, 7, 78, 482, 308, 464, 310, 450, 238, 408, 317, 234, 32, 258, 123, 465, 416, 324, 365, 333, 102, 433, 492, 473, 142, 254, 76, 276, 445, 359, 251, 299, 27, 201, 372, 60, 87, 197, 288, 275, 311, 14, 454, 469, 124, 459, 196, 368, 305, 460, 432, 427, 220, 360, 227, 156, 173, 131, 26, 88, 401, 483, 91, 69, 280, 128, 117, 199]\n"}︡{"done":true}










