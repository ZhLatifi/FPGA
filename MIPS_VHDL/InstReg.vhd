----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:08 05/17/2023 
-- Design Name: 
-- Module Name:    InstReg - Behavioral 
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

entity InstReg is
    Port ( RD : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           IRWrite : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0));
end InstReg;

architecture Behavioral of InstReg is

begin

	process (clk, IRWrite) 
	begin
	
		if (clk'event and clk = '1') then
		
			if (IRWrite = '1') then
			
				Instr <= RD;
				
			end if;
			
		end if;

	end process; 

end Behavioral;

