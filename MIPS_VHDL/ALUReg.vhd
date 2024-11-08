----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:11 05/17/2023 
-- Design Name: 
-- Module Name:    ALUReg - Behavioral 
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

entity ALUReg is
    Port ( ALUResult : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           ALUOut : out  STD_LOGIC_VECTOR (31 downto 0));
end ALUReg;

architecture Behavioral of ALUReg is

begin

	process (clk) 
	begin
	
		if (clk'event and clk = '1') then
		
			ALUOut <= ALUResult;
		
		end if;
		
	end process; 


end Behavioral;

