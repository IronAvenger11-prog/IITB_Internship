p1 = [1, 2, 3]

p1 =

     1     2     3

p2 = [4, 5, 7]

p2 =

     4     5     7

n = cross(p1,p2)

n =

    -1     5    -3

mod_n = sqrt( (-1)^2 + 5^2 + (-3)^2)

mod_n =

    5.9161

th_x = degrees(acosd(-1/mod_n))
Unrecognized function or variable 'degrees'.
 
th_x = (acosd(-1/mod_n))

th_x =

   99.7315

th_y = acosd(5/mod_n)

th_y =

   32.3115

th_z = acosd(-3/mod_n)

th_z =

  120.4704

Rc = [cos(th_y)*cos(th_z) -cos(th_y)*cos(th_z) sin(th_y) 0; sin(th_x)*sin(th_y)*sin(th_z)+cos(th_x)*sin(th_z)  -sin(th_x)*sin(th_y)*sin(th_z)+cos(th_x)*cos(th_z) -sin(th_x)*cos(th_y) 0;-cos(th_x)*sin(th_y)*cos(th_z)+sin(th_x)*sin(th_z) cos(th_x)*sin(th_y)*sin(th_z)+sin(th_x)*cos(th_x)  cos(th_x)*cos(th_y) 0; 0 0 0 1]

Rc =

    0.2892   -0.2892    0.7806         0
    0.1218    0.8187    0.4482         0
   -0.8874   -0.0174    0.4357         0
         0         0         0    1.0000

P1 = [1; 2; 3; 1]

P1 =

     1
     2
     3
     1

Rc*P1

ans =

    2.0526
    3.1036
    0.3849
    1.0000

T = [1 0 0 (4 - 2.0526);0 1 0 (5 - 3.1036); 0 0 1 (7 - 0.3849); 0 0 0 1]

T =

    1.0000         0         0    1.9474
         0    1.0000         0    1.8964
         0         0    1.0000    6.6151
         0         0         0    1.0000

M = T*Rc

M =

    0.2892   -0.2892    0.7806    1.9474
    0.1218    0.8187    0.4482    1.8964
   -0.8874   -0.0174    0.4357    6.6151
         0         0         0    1.0000

M*P1

ans =

    4.0000
    5.0000
    7.0000
    1.0000

n

n =

    -1     5    -3

z = [0 0 1]

z =

     0     0     1

acosd(-3/mod_n)

ans =

  120.4704

mod_n

mod_n =

    5.9161

mod_n*cos(acosd(-3/mod_n))

ans =

    2.7369

T

T =

    1.0000         0         0    1.9474
         0    1.0000         0    1.8964
         0         0    1.0000    6.6151
         0         0         0    1.0000

sqrt(1.9474^2 + 1.8964^2 + 6.6151^2)

ans =

    7.1518

sqrt(1.9474^2 + 1.8964^2 + 6.6151^2)*cos(acosd(-3/mod_n))

ans =

    3.3086

a = atand((2-1.25)/(1+2*1.25))

a =

   12.0948

rxy = [cos(a) -sin(a) 0; sin(a) cos(a) 0; 0 0 1]

rxy =

    0.8908    0.4543         0
   -0.4543    0.8908         0
         0         0    1.0000

t = [1 0 3.3086*cos(a); 0 1 3.3086*sin(a); 0 0 1]

t =

    1.0000         0    2.9474
         0    1.0000   -1.5032
         0         0    1.0000

p = [1; 2; 1]

p =

     1
     2
     1

M' = t*rxy
 M' = t*rxy
    ↑
Incorrect use of '=' operator. Assign a value to a variable using '=' and compare values for equality using '=='.
 
m0 = t*rxy

m0 =

    0.8908    0.4543    2.9474
   -0.4543    0.8908   -1.5032
         0         0    1.0000

m0*p

ans =

    4.7469
   -0.1758
    1.0000

p*m0
Error using  * 
Incorrect dimensions for matrix multiplication. Check that the number of columns in the first matrix matches the number of rows in the second matrix. To perform elementwise
multiplication, use '.*'.

Related documentation
 
m0 = rxy*t

m0 =

    0.8908    0.4543    1.9427
   -0.4543    0.8908   -2.6782
         0         0    1.0000

m0*p

ans =

    3.7422
   -1.3508
    1.0000

