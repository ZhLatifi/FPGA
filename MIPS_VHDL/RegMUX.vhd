----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:12:00 05/17/2023 
-- Design Name: 
-- Module Name:    RegMUX - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegMUX is
    Port ( ALUOut : in  STD_LOGIC_VECTOR (31 downto 0);
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           MemtoReg : in  STD_LOGIC;
           writedata : out  STD_LOGIC_VECTOR (31 downto 0));
end RegMUX;

architecture Behavioral of RegMUX is

begin

	with MemtoReg select writedata <=
			 Data when '1',
			 ALUOut	when others;
		 
end Behavioral;

