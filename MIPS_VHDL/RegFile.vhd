----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:17:00 05/17/2023 
-- Design Name: 
-- Module Name:    RegFile - Behavioral 
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

entity RegFile is
    Port ( readreg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           readreg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           writereg : in  STD_LOGIC_VECTOR (4 downto 0);
           writedata : in  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in  STD_LOGIC;
           RegWrite : in  STD_LOGIC;
           readdata1 : out  STD_LOGIC_VECTOR (31 downto 0);
           readdata2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegFile;

architecture Behavioral of RegFile is

	type RAM_type is array(0 to 31) of std_logic_vector(31 downto 0);
	signal ram : RAM_type := (x"00000000", x"00000000", x"00000000", others => x"00000000");

begin
	
	process (clk)
	begin
		if (clk'event and clk= '1') then
		
				if (RegWrite = '1') then
					ram(conv_integer(writereg)) <= writedata;
				end if;

				if (conv_integer(readreg1) = 0) then
					readdata1 <= x"00000000";
				else
					readdata1 <= ram(conv_integer(readreg1));
				end if;
				
				if (conv_integer(readreg2) = 0) then
					readdata2 <= x"00000000";
				else
					readdata2 <= ram(conv_integer(readreg2));
				end if;
		end if;	
		
	end process;

end Behavioral;

