library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dff is
  port (clk, reset, en	: in std_logic;
	D		: in unsigned(63 downto 0);
	Q		: out unsigned(63 downto 0));
end dff;

architecture Behavioral of dff is
	signal Q_int : unsigned(63 downto 0) := (others => '0');
	   
begin
process (clk, reset)
begin

    if (reset='1') then 
    Q_int <= x"0000000000000000"; -- clear out the register bank
    elsif rising_edge (clk) then
    if (en='1')then
    Q_int <= D; -- copy the ALU output
    else
    Q_int <= Q_int ; -- hold the old value
    
    end if;
    end if;
    end process;
    Q <= Q_int;
    
end Behavioral;

	  
