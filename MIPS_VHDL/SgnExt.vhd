----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:52:19 05/16/2023 
-- Design Name: 
-- Module Name:    SgnExt - Behavioral 
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

entity SgnExt is
    Port ( imm16 : in  STD_LOGIC_VECTOR (15 downto 0);
           imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SgnExt;

architecture Behavioral of SgnExt is
	
begin

	imm32 <=  (x"ffff" & imm16) when (imm16(15)='1') else  (x"0000" & imm16);
	
end Behavioral;

