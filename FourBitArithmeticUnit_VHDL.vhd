----------------------------------------------------------------------------------
-- Company: QMUL DSD Group 2
-- Engineer: 
-- 
-- Create Date:    22:39:08 10/20/2016 
-- Design Name: 	4-bit Arithmetic Unit
-- Module Name:    FourBitArithmeticUnit_VHDL - Behavioral 
-- Project Name: 	Lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: Single arithmetic unit with 2 4 bit inputs and 2 bit control
--
-- Dependencies: 
--						-fourbitAdderSubtractor_VHDL
--							*nbit_xor_control
--							*FourbitLACAdder_VHDL
--								*nbit_Adder_VHDL
--									*FullAdder_VHDL
--										*HalfAdder_VHDL
--										*TwoInputOR_VHDL
--						-TwoInputMultiplexor_VHDL
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FourBitArithmeticUnit_VHDL is
    Port ( InA : in  STD_LOGIC_VECTOR (3 downto 0);
           InB : in  STD_LOGIC_VECTOR (3 downto 0);
           Control : in  STD_LOGIC_VECTOR (1 downto 0);
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           C_out : out  STD_LOGIC);
end FourBitArithmeticUnit_VHDL;

architecture Behavioral of FourBitArithmeticUnit_VHDL is

	--define n-bit 2-input mux component I/O
	component nbitTwoInputMux_VHDL is
	generic (n: positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR (n-1 downto 0);
           InB : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Control : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	--define 4-bit adder subtractor component port I/O
	component fourbitAdderSubtractor_VHDL is
    Port ( InA : in  STD_LOGIC_VECTOR (3 downto 0);
           InB : in  STD_LOGIC_VECTOR (3 downto 0);
           Control : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           C_out : out  STD_LOGIC);
	end component;
	
	signal mux_Output : std_logic_vector (3 downto 0);

begin

	--define connections within the device
	initMux: nbitTwoInputMux_VHDL port map (std_logic_vector(to_unsigned(1, 4)), InB, Control(0), mux_Output);--define mux conections within the device
	initAddSub: fourbitAdderSubtractor_VHDL port map(InA, mux_Output, Control(1), Sum, C_out);--define AddSub conections within the device


end Behavioral;

