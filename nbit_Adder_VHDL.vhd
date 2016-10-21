----------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
-- 
-- Create Date:    18:31:39 10/20/2016 
-- Design Name: 	n-bit Adder
-- Module Name:    nbit_Adder_VHDL - Behavioral 
-- Project Name: 	Lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: Implenation of a single n-bit adder with a default of 4.
--
-- Dependencies: 
--						-FullAdder_VHDL
--							*HalfAdder_VHDL
--							*TwoInputOR_VHDL
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nbit_Adder_VHDL is
    Generic( n :positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR (n-1 downto 0);
           InB : in  STD_LOGIC_VECTOR (n-1 downto 0);
           C_terms : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Sum : out  STD_LOGIC_VECTOR (n-1 downto 0);
           C_out : out  STD_LOGIC);
end nbit_Adder_VHDL;



architecture Behavioral of nbit_Adder_VHDL is

	--define full adder component inputs and outputs to use in n-bit adder
    component FullAdder_VHDL
      Port ( a : in  STD_LOGIC;
			    b : in  STD_LOGIC;
             Cin : in  STD_LOGIC;
             s : out  STD_LOGIC;
             Cout : out  STD_LOGIC);
	 end component;
	 
	 signal C_NotUsed : STD_LOGIC_VECTOR (n-2 downto 0) := (others =>'0');

begin

	--loop through all n adders to map their I/O ports
	nbitInst: for i in (n-2) downto 0 generate
		FAdd: FullAdder_VHDL port map (InA(i), InB(i), C_terms(i), Sum(i), C_NotUsed(i));--map I/O ports of i full adder
   end generate;
	lastnbitInst: FullAdder_VHDL port map (InA(n-1), InB(n-1), C_terms(n-1), Sum(n-1), C_out);--map I/O ports of last full adder

end Behavioral;

