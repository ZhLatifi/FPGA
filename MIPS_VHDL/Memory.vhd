----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:44:44 05/17/2023 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
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

entity Memory is
    Port ( Adr : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           MemWrite : in  STD_LOGIC;
           RD : out  STD_LOGIC_VECTOR (31 downto 0));
end Memory;

architecture Behavioral of Memory is

	type Mem_type is array (0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
	Signal mem : Mem_type := (
		x"3c010ff0",	-- LUI  R1, 0x0FF0
		x"3c010008",	-- ADDI R2, R0, 0x0008
		x"14220005",	-- BNE  R1, R2, branch
		x"ac610000",	-- SW   R3, 0(R1)
		x"00221822",	-- branch: SUB  R3, R1, R2
		x"ac420000",   -- SW   R1, 0(R2)
		others => x"00000000");

begin

	process (clk)
	begin 
		if (clk' event and clk = '1') then 
			if (MemWrite = '1') then 
				mem(conv_integer(Adr)) <= B; 
			elsif (MemWrite = '0') then 
				RD <= mem(conv_integer(Adr)); 
			end if; 
		end if; 
	end process;

end Behavioral;

