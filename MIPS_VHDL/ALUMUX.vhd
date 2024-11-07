----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:37:07 05/16/2023 
-- Design Name: 
-- Module Name:    ALUMUX - Behavioral 
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

entity ALUMUX is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
			  B : in  STD_LOGIC_VECTOR (31 downto 0);
           imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
			  PC : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUSrcA : in  STD_LOGIC;
           ALUSrcB : in  STD_LOGIC_VECTOR (1 downto 0);
           SrcA : out  STD_LOGIC_VECTOR (31 downto 0);
           SrcB : out  STD_LOGIC_VECTOR (31 downto 0));			  
end ALUMUX;

architecture Behavioral of ALUMUX is

begin

  with ALUSrcA select SrcA <=
		 A when '1',
		 PC	when others;
		 
		 
  with ALUSrcB select SrcB <=
       B when "00",
		 "00000000000000000000000000000100" when "01",
		 imm32 when "10",
       (imm32(29 downto 0) & "00") when others; -- immidiate with sign extention and 2 bits Lshift
		 

		 
end Behavioral;

