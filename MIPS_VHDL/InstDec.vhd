----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:15:00 05/16/2023 
-- Design Name: 
-- Module Name:    InstDec - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstDec is
    Port ( instr : in  STD_LOGIC_VECTOR (31 downto 0);
			  RegDst : in  STD_LOGIC;
           readreg1 : out  STD_LOGIC_VECTOR (4 downto 0);
           readreg2 : out  STD_LOGIC_VECTOR (4 downto 0);
           writereg : out  STD_LOGIC_VECTOR (4 downto 0);
           Op : out  STD_LOGIC_VECTOR (5 downto 0);
			  Funct : out  STD_LOGIC_VECTOR (5 downto 0);
           imm16 : out  STD_LOGIC_VECTOR (15 downto 0);
			  Addr : out  STD_LOGIC_VECTOR (25 downto 0));

end InstDec;

architecture Behavioral of InstDec is

begin

	Op <= instr(31 downto 26);
	Funct <= instr(5 downto 0) when instr(31 downto 26) = "000000" else "000000";
	readreg1 <= instr(25 downto 21);
	readreg2 <= instr(20 downto 16);
	
-- writereg is for read/write based on regDst's value
	writereg <= instr(15 downto 11) when RegDst = '1'
			 else instr(20 downto 16);
	imm16 <= instr(15 downto 0);
	Addr <= instr(25 downto 0);

end Behavioral;

