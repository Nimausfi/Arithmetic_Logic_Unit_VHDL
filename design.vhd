library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity design is
   port(clk, reset, en  : in std_logic;
	sel  	 	: in unsigned(2 downto 0);
	A 	 	: in unsigned(31 downto 0);
	B 	 	: in unsigned(31 downto 0);
	Output	 	: out unsigned(63 downto 0);
	overflow 	: out std_logic);
end design;

architecture Behavioral of design is
	signal Out_int  : unsigned(63 downto 0) := (others => '0');
	signal O	: unsigned(63 downto 0) := (others => '0');
begin

	Output <= Out_int;
	
	alu : entity work.alu
		port map ( A => A, sel => sel, B => Out_int (31 downto 0), O => O );

	dff : entity work.dff
		port map ( clk => clk, reset => reset, en => en, D => O, Q => Out_int );

	o_flow : entity work.overflow
		port map ( data => Out_int(63 downto 32), overflow => overflow );

end Behavioral;

		
