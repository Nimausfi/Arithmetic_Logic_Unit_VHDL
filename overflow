library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_misc.all;

entity overflow is
  port (data	 : in unsigned(31 downto 0);
	overflow : out std_logic);
end overflow;

architecture Behavioral of overflow is

begin
process (data)
begin
if (data > 31) then
   
   overflow <= '1'; 
     
   else overflow <= '0' ;   

end if ;
end process;
end Behavioral;

