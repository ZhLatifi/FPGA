----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:55:04 05/15/2023 
-- Design Name: 
-- Module Name:    Control_unit - Behavioral 
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
-- arithmetic Functtions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CtrlUnit is
    Port ( Op : 			 in  STD_LOGIC_VECTOR (5 downto 0);
			  Funct : 		 in  STD_LOGIC_VECTOR (5 downto 0);
			  clk : 			 in STD_LOGIC;			  
			  PCSrc : 		 out  STD_LOGIC_VECTOR (1 downto 0);
			  PCWrite : 	 out  STD_LOGIC;
           RegDst : 		 out  STD_LOGIC;
           Branch :      out  STD_LOGIC;
           MemtoReg :    out  STD_LOGIC;
           ALUCtrl :     out  STD_LOGIC_VECTOR (3 downto 0);
           MemWrite :    out  STD_LOGIC;
			  IorD :    	 out  STD_LOGIC;
			  IRWrite :     out  STD_LOGIC;
           ALUSrcA :     out  STD_LOGIC;
			  ALUSrcB :     out  STD_LOGIC_VECTOR (1 downto 0);
           RegWrite :    out  STD_LOGIC);
end CtrlUnit;

architecture Behavioral of CtrlUnit is

-----------This signals are used to decode the instruction, and are passed to FSM--------------
--	signal Op : STD_LOGIC_VECTOR(5 downto 0);
--	signal RA:  	 STD_LOGIC_VECTOR(4 downto 0);
--	signal RB:  	 STD_LOGIC_VECTOR(4 downto 0);
--	signal RD:  	 STD_LOGIC_VECTOR(4 downto 0);
--	signal imm: 	 STD_LOGIC_VECTOR(15 downto 0);
--	signal jadd:    STD_LOGIC_VECTOR(25 downto 0);
--	signal Funct:    STD_LOGIC_VECTOR(5 downto 0);
	
	
------------------------------------current_s --------------------------------------------------
	type current_s_type is (Fetch, Decode, Memory, RItype, Branching, Jump, Load, Store, WBfromMem, WBfromReg );
	
	-- current_s Signals
	signal current_s, next_s: current_s_type;

begin


----------------------------------- current state assignment --------------------------------------
fsm_assignment: process (clk) is
	begin
		if rising_edge(clk) then
				current_s <= next_s; 
		end if;
end process fsm_assignment;


--------------------------------- Finite state Machine ------------------------------------
finite_state_machine: process (current_s, Op) is
begin
    case current_s is

			when Fetch =>
				next_s <= Decode;
				
			----------------------------------------------------------------------------------	
				
			when Decode =>
				if Op(5) = '1' then
				-- Load and Store Instructions
					next_s <= Memory; 
					
				elsif Op = "000010" or Op = "000011" then
				--J-Type instructions
					next_s <= Jump;
					
				elsif Op = "000000" or Op(3) = '1' then
				-- Arithmatic instructions
					next_s <= RItype;
					
				elsif Op = "000100" or Op = "000101" then 
				-- Branch instructions
					next_s <= Branching; 
					
				else
				-- No Operarion
				next_s <= Fetch; 

				
				end if;
			 
			 
			----------------------------------------------------------------------------------
			
			when Memory =>
				if Op = "100011" then
					next_s <= Load;
			  
				elsif Op = "101011" then
					next_s <= Store;
					
			   end if;
			----------------------------------------------------------------------------------  

			when RItype =>
					next_s <= WBfromReg;
					
			----------------------------------------------------------------------------------  

			when Jump =>
				if Op = "000011" then 
				-- Jump and Link
					next_s <= WBfromReg; 
				else
				-- Jump (without Link)
					next_s <= Fetch;
				end if;
			  
			----------------------------------------------------------------------------------

			when Branching => 
			  next_s <= Fetch;
			  
			----------------------------------------------------------------------------------
			  
			when Load =>
			  next_s <= WBfromMem;
			  
			----------------------------------------------------------------------------------
			
			when Store =>
			  next_s <= Fetch;	  

			----------------------------------------------------------------------------------  
			
			when WBfromMem =>
				next_s <= Fetch;
					
			----------------------------------------------------------------------------------  
			
			when WBfromReg =>
				next_s <= Fetch;
					
			----------------------------------------------------------------------------------		
    end case;
end process finite_state_machine;



----------------------------------- Let's talk about PC! ----------------------------------

PCWrite <=  		'1' when current_s = Fetch else
						'1' when current_s = RItype and Funct = "001000" else
						'1' when current_s = RItype and Funct = "001001" else
						'1' when current_s = Jump else '0';

PcSrc <=  	 		"10" when current_s = Jump else
						"00" when current_s = Branching else "01";

-------------------------------Other Control Signals: -------------------------------------

IorD     <=			'1' when current_s = Load else
						'1' when current_s = Store else '0';
-------------------------------------------------------------------------------						
MemWrite <=       '1' when current_s = Store else '0';
-------------------------------------------------------------------------------
Branch   <=       '1' when current_s = Branching else '0';
-------------------------------------------------------------------------------
MemtoReg <=       '1' when current_s = Load else '0';
-------------------------------------------------------------------------------
IRWrite  <=       '1' when current_s = Fetch else '0';
-------------------------------------------------------------------------------
RegDst   <=       '0' when current_s = Branching else
						'0' when current_s = RItype and Op(3) = '1' else '1';
-------------------------------------------------------------------------------						
--RegWrite <=       '0' when current_s = Branching else
--						'0' when current_s = Store else
--						'0' when current_s = Jump and Op = "000010" else
--						'0' when current_s = RItype and Funct = "001000" else '1';

RegWrite <=       '1' when current_s = RItype and Funct /= "001000" else
						'1' when current_s = Load else
						'1' when current_s = Jump and  Op = "000011" else '0';
-------------------------------------------------------------------------------
ALUSrcA  <=  		'0' when current_s = Fetch else '1';
-------------------------------------------------------------------------------
ALUSrcB  <=       "10" when current_s = RItype and Op(3) = '1' else
						"11" when current_s = Branching else
						"01" when current_s = Fetch  else "00";
-------------------------------------------------------------------------------
ALUCtrl    <=     "0000" when current_s = RItype 		and  (Funct(5 downto 1) = "10000" or Op(5 downto 1) = "00100") else  --add, addu, addi, addui
						"0000" when current_s = Memory      or current_s = Store or current_s = Load or current_s = Fetch else -- lw, sw
						"0001" when current_s = RItype 		and  Funct(5 downto 1) = "10001" else --sub, subu
						"0010" when current_s = RItype 		and (Funct = "100100" or Op = "001100") else --and, andi
						"0011" when current_s = RItype 		and (Funct = "100101" or Op = "001101") else --or, ori
						"0100" when current_s = RItype 		and (Funct = "100110" or Op = "001110") else --xor, xori
						"0101" when current_s = RItype 		and  Funct = "100111" else --nor
						"0000" when current_s = RItype 		and (Funct(5 downto 1) = "10101" or Op(5 downto 1) = "00101") else --slt, sltu, slti, sltiu
						"1000" when current_s = RItype 		and Funct = "011001" else --multu
						"1001" when current_s = RItype 		and Funct = "010000" else --mfhi
						"1010" when current_s = RItype 		and Funct = "010010" else --mflo
						"1100" when current_s = Branching 	and Op = "000100" else --BEQ
						"1101" when current_s = Branching 	and Op = "000101" else --BNE
						"0111" when current_s = RItype and 	Op = "001111" else --lui
						"0110" when current_s = RItype and 	Op = "001111" else "1111"; --jr, jalr
------------------------------------------------------------------------------
						
end Behavioral;

