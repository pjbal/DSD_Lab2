--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   22:29:06 10/20/2016
-- Design Name:   Test bench n-bit two input Mux
-- Module Name:   H:/Documents/DSD/LAB2/nbitTwoInputMux/TB_nbitTwoInputMux_VHDL.vhd
-- Project Name:  nbitTwoInputMux
-- Target Device:  
-- Tool versions:  
-- Description:   Test bench to test all possible input to n-bit two input Mux
-- 
-- VHDL Test Bench Created by ISE for module: nbitTwoInputMux_VHDL
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
USE ieee.numeric_std.ALL;
 
ENTITY TB_nbitTwoInputMux_VHDL IS
END TB_nbitTwoInputMux_VHDL;
 
ARCHITECTURE behavior OF TB_nbitTwoInputMux_VHDL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nbitTwoInputMux_VHDL
    PORT(
         InA : IN  std_logic_vector(3 downto 0);
         InB : IN  std_logic_vector(3 downto 0);
         Control : IN  std_logic;
         Output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal InA : std_logic_vector(3 downto 0) := (others => '0');
   signal InB : std_logic_vector(3 downto 0) := (others => '0');
   signal Control : std_logic := '0';

 	--Outputs
   signal Output : std_logic_vector(3 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nbitTwoInputMux_VHDL PORT MAP (
          InA => InA,
          InB => InB,
          Control => Control,
          Output => Output
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
					Control <= k;
								
					wait for 100ns;--wait to see responce		
					
				end loop;
			end loop; 
		end loop;

      wait;
   end process;

END;
