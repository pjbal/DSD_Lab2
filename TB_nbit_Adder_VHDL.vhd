--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   19:07:51 10/20/2016
-- Design Name:   Test Bench N-bit Adder
-- Module Name:   H:/Documents/DSD/LAB2/nbit_Adder/TB_nbit_Adder_VHDL.vhd
-- Project Name:  nbit_Adder
-- Target Device:  
-- Tool versions:  
-- Description:   Test bench to simulate all possible inputs of n-bit adder
-- 
-- VHDL Test Bench Created by ISE for module: nbit_Adder_VHDL
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_nbit_Adder_VHDL IS
END TB_nbit_Adder_VHDL;
 
ARCHITECTURE behavior OF TB_nbit_Adder_VHDL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	 
 
    COMPONENT nbit_Adder_VHDL
    PORT(
         InA : IN  std_logic_vector;
         InB : IN  std_logic_vector;
         C_terms : IN  std_logic_vector;
         Sum : OUT  std_logic_vector;
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal InA : std_logic_vector(3 downto 0) := (others =>'0');
   signal InB : std_logic_vector(3 downto 0) := (others =>'0');
   signal C_terms : std_logic_vector(3 downto 0) := (others =>'0');

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal C_out : std_logic;

 
BEGIN
   
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nbit_Adder_VHDL PORT MAP (
          InA => InA,
          InB => InB,
          C_terms => C_terms,
          Sum => Sum,
          C_out => C_out
        );
 

   -- Stimulus process
   stim_proc: process
	variable n:  integer := 4;--difine n as number of bus lines
	begin	


      -- hold reset state for 100 ns.
      wait for 100 ns;	

		--loop through all combinations of inputs
		loop0: for i in ((n*n)-1) downto 0 loop --loop through all combinations of InA
			loop1: for j  in ((n*n)-1) downto 0  loop --loop through all combinations of InA(i)
				loop2: for k  in ((n*n)-1) downto 0  loop --loop through all combinations of C_terms					
								
					--assign new combination
					InA <= std_logic_vector(to_unsigned(i, n));
					InB <= std_logic_vector(to_unsigned(j, n));
					C_terms <= std_logic_vector(to_unsigned(k, n));
								
					wait for 100ns;--wait to see responce							
				end loop;
			end loop; 
		end loop;				
						

      wait;--wait forever
   end process;

END;

