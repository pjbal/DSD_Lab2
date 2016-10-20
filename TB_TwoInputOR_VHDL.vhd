--------------------------------------------------------------------------------
-- Company: QMUL DSD Group
-- Engineer: Patrick Balcombe
--
-- Create Date:   20:36:15 10/09/2016
-- Design Name:   Test bench for TwoInputOR
-- Module Name:   H:/Documents/DSD/LAB1/DSD_LAB1_TwoInputOR/TB_TwoInputOR_VHDL.vhd
-- Project Name:  DSD_LAB1_TwoInputOR
-- Target Device:  
-- Tool versions:  
-- Description:   Test Bench to go through all possible inputs.
-- 
-- VHDL Test Bench Created by ISE for module: TwoInputOR_VHDL
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
 
ENTITY TB_TwoInputOR_VHDL IS
END TB_TwoInputOR_VHDL;
 
ARCHITECTURE behavior OF TB_TwoInputOR_VHDL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TwoInputOR_VHDL
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sig_a : std_logic := '0';
   signal sig_b : std_logic := '0';

 	--Outputs
   signal sig_c : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TwoInputOR_VHDL PORT MAP (sig_a, sig_b, sig_c);

    -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		--loop through all combinations of input variables
		floop1: for i in std_logic range '0' to '1' loop
			floop2: for j in std_logic range '0' to '1' loop
			
				--apply new signal values
				sig_a <= j;
				sig_b <= i;
				
				wait for 100ns;
				
			end loop;
		end loop;--end of combinations loops

      wait;--wait forever
   end process;

END;
