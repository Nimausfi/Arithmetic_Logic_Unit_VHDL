library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY designtests20 IS
END designtests20;
 
ARCHITECTURE behavior OF designtests20 IS 
 
    COMPONENT design
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         en : IN  std_logic;
         sel : IN  unsigned(2 downto 0);
         A : IN  unsigned(31 downto 0);
         B : IN unsigned (31 downto 0);
         Output : OUT  unsigned(63 downto 0);
         overflow : OUT  std_logic
        );
    END COMPONENT;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   
   --Inputs 
   signal clk, reset, en : std_logic := '0';
   signal sel            : unsigned(2 downto 0) := (others => '0');
   signal A              : unsigned(31 downto 0) := (others => '0');
   signal B              : unsigned(31 downto 0) := (others => '0');

   --Outputs
   signal Output   : unsigned(63 downto 0);
   signal overflow : std_logic;
 
BEGIN
   
   -- Instantiate the Unit Under Test (UUT)
   uut: design PORT MAP (
          clk => clk,
          reset => reset,
          en => en,
          sel => sel,
          A => A,
          B => B,
          Output => Output,
          overflow => overflow);

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

    -- Stimulus process
    stim_proc: process
    begin 
    -- hold reset state for 10 ns.
    wait for clk_period ;
    wait for clk_period/2;
    
    reset <= '1';  en <= '0'; 
    wait for clk_period ; 
    reset <= '0'; en <= '1';
        
    wait for clk_period ;
    A <= x"00000006" ; en <= '1' ;
    sel <= "000" ; -- addition
    wait for clk_period ;
    A <= x"00000002" ;
    sel <= "001" ; -- multiplication 
    wait for clk_period ;
    A <= x"00000000" ;
    sel <= "010" ; --- shift left by 1
       
    wait for clk_period*4 ; 
    A <= x"00000002" ;
    sel <= "000" ; -- addition
    wait for clk_period ; 
    sel <= "100" ; -- compare if equal
    
    wait for clk_period ;    
    A <= x"00000001" ; 
    sel <= "000" ; -- addition
    A <= x"00000003" ;
    wait for clk_period ;
    sel <= "001" ; -- multiplication
    wait for clk_period ;
    A <= x"00000000" ;
    sel <= "011" ; --- right shift by 1
    
    wait for clk_period ;
    A <= x"00000020"  ;
    sel <= "000" ; -- addition
    -- the reset function deleted here since we have one in the next.
    wait for clk_period*4 ;
    
    wait for clk_period ;
    reset <= '1' ; en <= '0' ; -- reset  is ON
    wait for clk_period*4 ;
    reset <= '0' ; en <= '1' ; 
    
    wait for clk_period ;
    A <= x"00000007" ; en <= '1' ;
    sel <= "000" ; -- addition
    wait for clk_period ;
    A <= x"00000000" ; en <= '1' ;
    sel <= "101" ; -- compare if A < B 
    
    wait for clk_period ;
    A <= x"00000020" ; en <= '1' ;
    sel <= "001" ; -- multiplication
    wait for clk_period*4 ;
    reset <= '1' ; en <= '0' ; -- reset  is ON
    wait for clk_period ; 
    reset <= '0' ; en <= '1' ; -- reset  is ON
    wait for clk_period*4 ;
       
    -- insert stimulus here 

      wait;
   end process;

END;

