----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:15:37 05/17/2023 
-- Design Name: 
-- Module Name:    PCMUX - Behavioral 
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

entity PCMUX is
    Port ( ALUResult : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOut : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSrc : in  STD_LOGIC_VECTOR (1 downto 0);
			  PC : in  STD_LOGIC_VECTOR (31 downto 0);
			  Addr : in  STD_LOGIC_VECTOR (25 downto 0);
           PCin : out  STD_LOGIC_VECTOR (31 downto 0));
end PCMUX;

architecture Behavioral of PCMUX is

    signal PCJump : STD_LOGIC_VECTOR (31 downto 0);
 
begin

	PCJump <= PC(31 downto 28) & Addr & "00";
	
	with PCSrc select PCin <=
			 ALUResult when "00",
			 ALUOut 	  when "01",
			 PCJump	  when others;

end Behavioral;

