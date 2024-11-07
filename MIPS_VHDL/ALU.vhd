----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:35:17 05/16/2023 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( SrcA : in  STD_LOGIC_VECTOR (31 downto 0);
           SrcB : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUctrl :  IN  STD_LOGIC_VECTOR(3 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

	--signal sub, add, comp2 : STD_LOGIC_VECTOR(31 downto 0);
	signal mulres : STD_LOGIC_VECTOR(63 downto 0);

begin

	Process (SrcA, SrcB, ALUctrl)
	begin 
		case (ALUctrl) is

		--	Arithmatic-Unit				
		when "0000" => ALUResult <= SrcA + SrcB;
							zero  <= '0';
		when "0001" => ALUResult <= SrcA - SrcB;
							zero  <= '0';
					
		--	Logical-Unit				
		when "0010" => ALUResult <= SrcA and SrcB;
		when "0011" => ALUResult <= SrcA or SrcB;
		when "0100" => ALUResult <= SrcA xor SrcB;
		when "0101" => ALUResult <= not(SrcA or SrcB);
		
		when "1011" =>	-- slt/sltu/slti/sltiu
			if (SrcA < SrcB) then ALUResult <= "00000000000000000000000000000001";
			elsif (SrcA > SrcB) then ALUResult <= "00000000000000000000000000000000";
			end if;
		
		when "1000" => -- multiply		
			mulRes <= SrcA * SrcB;
		when "1001" =>	-- mfhi
			ALUResult <= mulRes(63 downto 32);
		when "1010" => -- mflo
			ALUResult <= mulRes(31 downto 0);
			
		when "1100" => -- beq
			if (SrcA = SrcB) then zero <= '1';
			else zero <= '0';
			end if;
		when "1101" => -- bne
			if (SrcA = SrcB) then zero <= '0';
			else zero <= '1';
			end if;
			
		when "0111" => -- lui
			ALUResult <= SrcB(15 downto 0) & "0000000000000000";
		
		when "0110" => -- jr/jalr
			ALUResult <= SrcA(29 downto 0) & "00";
	
		when others => ALUResult <= (others => '0');
							zero <= '0';
		
		end case;
		
		end process; 


end Behavioral;

