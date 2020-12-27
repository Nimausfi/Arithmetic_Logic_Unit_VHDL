library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_misc.all;

entity alu is
  port (
	A, B : in unsigned(31 downto 0);
	sel  : in unsigned(2 downto 0);
	O    : out unsigned(63 downto 0));
end entity alu;

architecture Behavioral of alu is


begin
process(A, B, sel) 
begin
case sel is
 when "000" => 
 O <= (x"00000000" & A) + (x"00000000" & B) ; -- addition 
 when "001" => 
 O <= (A * B) ; -- multiplication
 when "010" => 
 O <= x"00000000"&B sll 1 ; -- shift left 
 when "011" => 
 O <= x"00000000"&B srl 1 ; -- right right 
 when "100" =>
 if (A=B) then -- compare if A=B
 O <= x"0000000000000001" ;
 else 
 O <= x"0000000000000000" ; 
 end if;
 when "101" =>
 if (A<B) then -- compare if A<B
 O <= x"0000000000000001" ;
 else
 O <= x"0000000000000000" ;
 end if;
 when others =>
 NULL;
 end case; 
  
 end process;
 
 end Behavioral;
 
 
