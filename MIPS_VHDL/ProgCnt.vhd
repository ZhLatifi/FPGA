----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:47 05/17/2023 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity ProgCnt is
    Port ( PCin : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           PCEn : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgCnt;

architecture Behavioral of ProgCnt is

begin

	process (clk, PCEn) 
	begin  
	
		if (clk'event and clk = '1') then
		
			if(PCEn = '1') then
			
				PC <= PCin;
				
			end if;

		end if;

	end process; 

end Behavioral;

