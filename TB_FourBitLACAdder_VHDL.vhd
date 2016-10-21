--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   21:13:40 10/20/2016
-- Design Name:   Test Bench 4- bit LAC Adder
-- Module Name:   H:/Documents/DSD/LAB2/FourBitLACAdder/TB_FourBitLACAdder_VHDL.vhd
-- Project Name:  FourBitLACAdder
-- Target Device:  
-- Tool versions:  
-- Description:   test bench to test all combinations of Inputs for FourBitLACAdder
-- 
-- VHDL Test Bench Created by ISE for module: FourBitLACAdder_VHDL
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_FourBitLACAdder_VHDL IS
END TB_FourBitLACAdder_VHDL;
 
ARCHITECTURE behavior OF TB_FourBitLACAdder_VHDL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitLACAdder_VHDL
    PORT(
         InA : IN  std_logic_vector(3 downto 0);
         InB : IN  std_logic_vector(3 downto 0);
         C_in : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0);
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal InA : std_logic_vector(3 downto 0) := (others => '0');
   signal InB : std_logic_vector(3 downto 0) := (others => '0');
   signal C_in : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal C_out : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitLACAdder_VHDL PORT MAP (
          InA => InA,
          InB => InB,
          C_in => C_in,
          Sum => Sum,
          C_out => C_out
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      loop0: for i in 15 downto 0 loop --loop through all combinations of InA
			loop1: for j  in 15 downto 0  loop --loop through all combinations of InB
				loop2: for k  in std_logic range '0' to '1'  loop --Use both posiible values of C_Term					
								
					--assign new combination
					InA <= std_logic_vector(to_unsigned(i, 4));
					InB <= std_logic_vector(to_unsigned(j, 4));
					C_terms <= k;
								
					wait for 100ns;--wait to see responce		
					
				end loop;
			end loop; 
		end loop;				

      wait;--wait forever 
   end process;

END;
