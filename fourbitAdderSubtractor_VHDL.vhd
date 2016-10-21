----------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: Patrick Balcombe
-- 
-- Create Date:    21:33:15 10/20/2016 
-- Design Name:    4-bit Adder/ Subtractor
-- Module Name:    fourbitAdderSubtractor_VHDL - Behavioral 
-- Project Name:  Lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: single 4-bit adder/subtractor with to sets of 4 bit input lines and control input to control operation
--
-- Dependencies: 
--						-nbit_xor_control
--						-FourbitLACAdder_VHDL
--							*nbit_Adder_VHDL
--								*FullAdder_VHDL
--									*HalfAdder_VHDL
--									*TwoInputOR_VHDL
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

entity fourbitAdderSubtractor_VHDL is
    Port ( InA : in  STD_LOGIC_VECTOR (3 downto 0);
           InB : in  STD_LOGIC_VECTOR (3 downto 0);
           Control : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           C_out : out  STD_LOGIC);
end fourbitAdderSubtractor_VHDL;

architecture Behavioral of fourbitAdderSubtractor_VHDL is

	--XOR control component definition
	component nbit_xor_contol is
	Generic ( n : positive := 4 );
    Port ( Input : in std_logic_vector(n-1 downto 0);
           control : in std_logic;
           Output : out std_logic_vector(n-1 downto 0));
	end component;
	
	--4-bit adder component defintion
	component FourbitLACAdder_VHDL is
    Port ( InA : in  STD_LOGIC_VECTOR (3 downto 0);
           InB : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           C_out : out  STD_LOGIC);
	end component;
	
	signal XOR_Output : std_logic_vector (3 downto 0);-- signal line from Xor contol output to InB of LAC adder

begin

	initXORCon: nbit_xor_contol port map (InB, Control, XOR_Output);--define XOR control conections within the device
	init4bitLACAdd: FourbitLACAdder_VHDL port map (InA, XOR_Output, Control, Sum, C_out);--ddefine 4-bit LAC Adder connectioins within the device

end Behavioral;

