--------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
--
-- Create Date:   14:36:33 10/21/2016
-- Design Name:   4-bit Arithmetic Unit
-- Module Name:   H:/Documents/DSD/LAB2/FourBitArithmeticUnit/TB_FourBitArithmeticUnit_VHDL.vhd
-- Project Name:  FourBitArithmeticUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
--
-- VHDL Test Bench Created by ISE for module: FourBitArithmeticUnit_VHDL
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
 
ENTITY TB_FourBitArithmeticUnit_VHDL IS
END TB_FourBitArithmeticUnit_VHDL;
 
ARCHITECTURE behavior OF TB_FourBitArithmeticUnit_VHDL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitArithmeticUnit_VHDL
    PORT(
         InA : IN  std_logic_vector(3 downto 0);
         InB : IN  std_logic_vector(3 downto 0);
         Control : IN  std_logic_vector(1 downto 0);
         Sum : OUT  std_logic_vector(3 downto 0);
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal InA : std_logic_vector(3 downto 0) := (others => '0');
   signal InB : std_logic_vector(3 downto 0) := (others => '0');
   signal Control : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal C_out : std_logic;
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitArithmeticUnit_VHDL PORT MAP (
          InA => InA,
          InB => InB,
          Control => Control,
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
				loop2: for k  in 3 downto 0  loop --loop through all combinations of Control					
								
					--assign new combination
					InA <= std_logic_vector(to_unsigned(i, 4));
					InB <= std_logic_vector(to_unsigned(j, 4));
					Control <= std_logic_vector(to_unsigned(k, 2));
								
					wait for 100ns;--wait to see responce		
					
				end loop;
			end loop; 
		end loop;

      wait;
   end process;

END;
