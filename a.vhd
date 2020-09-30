LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ripple_carry8 IS
PORT( e, f : IN STD_LOGIC_VECTOR(7 downto 0);
carry_in : IN STD_LOGIC;
S : OUT STD_LOGIC_VECTOR(7 downto 0);
carry_out : OUT STD_LOGIC);
END ripple_carry8;

ARCHITECTURE RTL of ripple_carry8 IS
BEGIN
PROCESS(E, F, CARRY_in)
VARIABLE tempC : STD_LOGIC_VECTOR(8 DOWNTO 0 );
VARIABLE P : STD_LOGIC_VECTOR (7 DOWNTO 0 );
VARIABLE G : STD_LOGIC_VECTOR(7 DOWNTO 0 );
BEGIN
tempC(0) := CARRY_in;
FOR i in 0 to 7 loop
P(i):=E(i) XOR F(i);
G(i):=E(i) AND F(i);
S(i)<= P(i) XOR tempC(i);
tempC(i+1):=G(i) OR (tempC(i) AND P(i));
END loop;
carry_out <= tempC(8);
END PROCESS;
END RTL;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY bit_fa IS
PORT ( x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
cin : IN STD_LOGIC;
o : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END bit_fa;

ARCHITECTURE Behavioral of bit_fa IS
SIGNAL c : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL sum : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL q : STD_LOGIC_VECTOR(7 DOWNTO 0);

COMPONENT ripple_carry8
PORT (e, f : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
carry_in : IN STD_LOGIC;
S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
carry_out : OUT STD_LOGIC);
END COMPONENT;

BEGIN
c(0)<=cin;

q<=(NOT y)+1;
p1:ripple_carry8 port map( x,q,cin,sum,c(8));
PROCESS(x,y,sum,c)
BEGIN
IF c(8)='0' then
o<=(NOT sum)+1;
ELSE
o<=sum;
END IF;
END PROCESS;
END Behavioral; 

--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ripple_carry12 IS
PORT ( A, B : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
C_in : IN STD_LOGIC;
S : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
C_out : OUT STD_LOGIC);
END ripple_carry12;
ARCHITECTURE RTL of ripple_carry12 IS
BEGIN
PROCESS (A, B, c_in)
VARIABLE tempC : STD_LOGIC_VECTOR(12 DOWNTO 0 );
VARIABLE P : STD_LOGIC_VECTOR(11 DOWNTO 0 );
VARIABLE G : STD_LOGIC_VECTOR(11 DOWNTO 0 );
BEGIN
tempC(0) := C_in;
FOR i in 0 to 11 LOOP
P(i):=A(i) XOR B(i);
G(i):=A(i) AND B(i);
S(i)<= P(i) XOR tempC(i);
tempC(i+1):=G(i) OR (tempC(i) AND P(i));
END LOOP;
C_out <= tempC(12);
END PROCESS;
END RTL;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY ripple_carry IS
PORT ( A, B : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
C_in : IN STD_LOGIC;
S : OUT STD_LOGIC_VECTOR(11 DOWNTO 0));
END ripple_carry;

ARCHITECTURE RTL of ripple_carry IS
BEGIN
PROCESS (A, B,  C_in)
VARIABLE tempC : STD_LOGIC_VECTOR(11 DOWNTO 0 );
VARIABLE P : STD_LOGIC_VECTOR(10 DOWNTO 0 );
VARIABLE G : STD_LOGIC_VECTOR(10 DOWNTO 0 );
BEGIN
tempC(0) := C_in;
FOR i in 0 to 10 LOOP
P(i):=A(i) XOR B(i);
G(i):=A(i) AND B(i);
S(i)<= P(i) XOR tempC(i);
tempC(i+1):=G(i) OR (tempC(i) AND P(i));
END LOOP;
s(11) <= tempC(11);
END PROCESS;
END;
------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY fulladder IS
PORT (fa, fb, fcin :IN STD_LOGIC;
fsout, fcout : OUT STD_LOGIC);
END fulladder;

ARCHITECTURE rtl of fulladder IS
BEGIN
fsout<= (fa XOR fb) XOR fcin;
fcout<= (fa AND fb) OR (fcin AND fb) OR (fa AND fcin);
END ;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY halfadder IS
PORT (ha, hb : IN STD_LOGIC;
hsout, hcout : OUT STD_LOGIC);
END halfadder;

ARCHITECTURE rtl of halfadder IS
BEGIN
hsout<= (ha XOR hb) ;
hcout<= (ha AND hb) ;
END ;

--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY reduce8 IS
PORT(p0, p1, p2, p3, p4, p5, p6, p7 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
sumi :OUT STD_LOGIC_VECTOR(11 DOWNTO 0 ));
END reduce8;

ARCHITECTURE Behavioral of reduce8 IS

COMPONENT ripple_carry
PORT( A, B : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
C_in : IN STD_LOGIC;
S : OUT STD_LOGIC_VECTOR(11 DOWNTO 0));
END COMPONENT;

COMPONENT halfadder
PORT (ha, hb : IN STD_LOGIC;
hsout : OUT STD_LOGIC;
hcout : OUT STD_LOGIC);
END COMPONENT;

COMPONENT fulladder
PORT (fa,fb, fcin : IN STD_LOGIC;
fsout, fcout : OUT STD_LOGIC);
END COMPONENT;

SIGNAL s1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL s3 : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL s4 : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL s5 : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL s6 : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL cd1: STD_LOGIC_VECTOR(8 DOWNTO 1);
SIGNAL cd2: STD_LOGIC_VECTOR(8 DOWNTO 1);
SIGNAL cd3: STD_LOGIC_VECTOR(9 DOWNTO 1);
SIGNAL cd4: STD_LOGIC_VECTOR(9 DOWNTO 1);
SIGNAL cd5: STD_LOGIC_VECTOR(10 DOWNTO 1);
SIGNAL cd6: STD_LOGIC_VECTOR(10 DOWNTO 0);

BEGIN

-------layer1
l1:FOR i in 0 to 7 GENERATE
BEGIN
fuladd1: fulladder PORT MAP (p0(i), p1(i), p2(i), s1(i), cd1(i+1));
END GENERATE l1;

------layer2
ha2: halfadder PORT MAP (s1(0), p3(0), s2(0), cd2(1));
l2:FOR i in 0 to 6 GENERATE
BEGIN
fuladd2: fulladder PORT MAP (s1(i+1), cd1(i+1), p3(i+1), s2(i+1), cd2(i+2));
END GENERATE l2;
s2(8)<= cd1(8);

-------------- layer3
ha3: halfadder PORT MAP (s2(0), p4(0), s3(0), cd3(1));
l3:FOR i in 0 to 6 GENERATE
BEGIN
fuladd3: fulladder PORT MAP (s2(i+1), cd2(i+1), p4(i+1), s3(i+1), cd3(i+2));
END GENERATE l3;
haa3: halfadder PORT MAP (s2(8), cd2(8), s3(8), cd3(9));

----------------layer4
ha4: halfadder PORT MAP (s3(0), p5(0), s4(0), cd4(1));
l4:FOR i in 0 to 6 GENERATE
BEGIN
fuladd4: fulladder PORT MAP (s3(i+1), cd3(i+1), p5(i+1), s4(i+1), cd4(i+2));
END GENERATE l4;
haa4: halfadder PORT MAP (s3(8), cd3(8), s4(8), cd4(9));
s4(9)<= cd3(9);
---------------layer 5
ha5: halfadder PORT MAP (s4(0), p6(0), s5(0), cd5(1));
l5:FOR i in 0 to 6 GENERATE
BEGIN
fuladd5: fulladder PORT MAP (s4(i+1), cd4(i+1), p6(i+1), s5(i+1), cd5(i+2));
END GENERATE l5;
haaa5: halfadder PORT MAP (s4(8), cd4(8), s5(8), cd5(9));
haaaa5: halfadder PORT MAP (s4(9), cd4(9), s5(9), cd5(10));

------------------------ layer6
ha6: halfadder PORT MAP (s5(0), p7(0), s6(0), cd6(1));
l6:FOR i in 0 to 6 GENERATE
BEGIN
fuladd6: fulladder PORT MAP (s5(i+1), cd5(i+1), p7(i+1), s6(i+1), cd6(i+2));
END GENERATE l6;
haaa6: halfadder PORT MAP (s5(8), cd5(8), s6(8), cd6(9));
haaaa6: halfadder PORT MAP (s5(9), cd5(9), s6(9), cd6(10));
s6(10)<= cd5(10);
cd6(0)<= '0';
rp: ripple_carry PORT MAP (s6, cd6, '0' , sumi);
END Behavioral;

--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY reducelayer16from8 IS
PORT(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
sum :OUT STD_LOGIC_VECTOR(11 DOWNTO 0 );
cout:OUT STD_LOGIC);
END reducelayer16from8;

ARCHITECTURE Behavioral of REDUCELAYER16FROM8 IS

COMPONENT reduce8 IS
PORT(p0, p1, p2, p3, p4, p5, p6, p7 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
sumi :OUT STD_LOGIC_VECTOR(11 DOWNTO 0 ));
END COMPONENT;

COMPONENT ripple_CARRY12
PORT( A, B : IN STD_LOGIC_VECTOR( 11 DOWNTO 0);
C_in : IN STD_LOGIC;
S : OUT STD_LOGIC_VECTOR( 11 DOWNTO 0);
C_out : OUT STD_LOGIC);
END COMPONENT;

SIGNAL sum1, sum2: STD_LOGIC_VECTOR(11 DOWNTO 0);
BEGIN
l1: reduce8 PORT MAP (i0, i1, i2, i3, i4, i5, i6, i7, sum1);
l2: reduce8 PORT MAP (i8, i9, i10, i11, i12, i13, i14, i15, sum2);
l3: ripple_carry12 PORT MAP (sum1, sum2, '0', sum, cout);
END Behavioral;

--------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY sadcompleteripplecarypro IS
PORT ( lx0, lx1, lx2, lx3, lx4, lx5, lx6, lx7, lx8, lx9, lx10, lx11, lx12, lx13, lx14, lx15: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
ly0, ly1, ly2, ly3, ly4, ly5, ly6, ly7, ly8, ly9, ly10, ly11, ly12, ly13, ly14, ly15: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
lsum :OUT STD_LOGIC_VECTOR(11 DOWNTO 0 );
lcout:OUT STD_LOGIC);
END sadcompleteripplecarypro;
ARCHITECTURE Behavioral of sadcompleteripplecarypro IS

COMPONENT bit_fa
PORT ( x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
cin : IN STD_LOGIC;
o : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;

COMPONENT reducelayer16from8 
PORT(i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
sum :OUT STD_LOGIC_VECTOR(11 DOWNTO 0) ;
cout : OUT STD_LOGIC);
END COMPONENT;

SIGNAL oxy0, oxy1, oxy2, oxy3, oxy4, oxy5, oxy6, oxy7, oxy8, oxy9, oxy10, oxy11, oxy12, oxy13, oxy14, oxy15: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
p0: bit_fa PORT MAP (lx0, ly0, '0', oxy0);
p1: bit_fa PORT MAP (lx1, ly1, '0', oxy1);
p2: bit_fa PORT MAP (lx2, ly2, '0', oxy2);
p3: bit_fa PORT MAP (lx3, ly3, '0', oxy3);
p4: bit_fa PORT MAP (lx4, ly4, '0', oxy4);
p5: bit_fa PORT MAP (lx5, ly5, '0', oxy5);
p6: bit_fa PORT MAP (lx6, ly6, '0', oxy6);
p7: bit_fa PORT MAP (lx7, ly7, '0', oxy7);
p8: bit_fa PORT MAP (lx8, ly8, '0', oxy8);
p9: bit_fa PORT MAP (lx9, ly9, '0', oxy9);
p10: bit_fa PORT MAP (lx10, ly10, '0', oxy10);
p11: bit_fa PORT MAP (lx11, ly11, '0', oxy11);
p12: bit_fa PORT MAP(lx12,ly12,'0',oxy12);
p13: bit_fa PORT MAP(lx13,ly13,'0',oxy13);
p14: bit_fa PORT MAP (lx14, ly14, '0', oxy14);
p15: bit_fa PORT MAP (lx15, ly15, '0', oxy15);
fp0: reducelayer16from8 PORT MAP (oxy0, oxy1, oxy2, oxy3, oxy4, oxy5, oxy6, oxy7, oxy8, oxy9, oxy10, oxy11, oxy12, oxy13, oxy14, oxy15, lsum, lcout);
END Behavioral;
