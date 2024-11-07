----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:59 05/17/2023 
-- Design Name: 
-- Module Name:    Areg - Behavioral 
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

entity ABreg is
    Port ( readdata1 : in  STD_LOGIC_VECTOR (31 downto 0);
           readdata2 : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           A : out  STD_LOGIC_VECTOR (31 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end ABreg;

architecture Behavioral of ABreg is

begin

	process (clk) 
	begin
	
		if (clk'event and clk = '1') then
		
			A <= readdata1;
			B <= readdata2;
		
		end if;
		
	end process; 

end Behavioral;

