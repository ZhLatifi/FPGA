--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:30:27 05/19/2023
-- Design Name:   
-- Module Name:   C:/ISE/Projects/FPGA/MidProj/MCProcessor/CtrlUnit_TB.vhd
-- Project Name:  MCProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CtrlUnit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CtrlUnit_TB IS
END CtrlUnit_TB;
 
ARCHITECTURE behavior OF CtrlUnit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CtrlUnit
    PORT(
         Op : IN  std_logic_vector(5 downto 0);
         Funct : IN  std_logic_vector(5 downto 0);
         clk : IN  std_logic;
         PCSrc : OUT  std_logic_vector(1 downto 0);
         PCWrite : OUT  std_logic;
         RegDst : OUT  std_logic;
         Branch : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         ALUCtrl : OUT  std_logic_vector(3 downto 0);
         MemWrite : OUT  std_logic;
         IorD : OUT  std_logic;
         IRWrite : OUT  std_logic;
         ALUSrcA : OUT  std_logic;
         ALUSrcB : OUT  std_logic_vector(1 downto 0);
         RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(5 downto 0) := (others => '0');
   signal Funct : std_logic_vector(5 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal PCSrc : std_logic_vector(1 downto 0);
   signal PCWrite : std_logic;
   signal RegDst : std_logic;
   signal Branch : std_logic;
   signal MemtoReg : std_logic;
   signal ALUCtrl : std_logic_vector(3 downto 0);
   signal MemWrite : std_logic;
   signal IorD : std_logic;
   signal IRWrite : std_logic;
   signal ALUSrcA : std_logic;
   signal ALUSrcB : std_logic_vector(1 downto 0);
   signal RegWrite : std_logic;

   -- Clock period definitions
   constant clk_period : time := 2.5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CtrlUnit PORT MAP (
          Op => Op,
          Funct => Funct,
          clk => clk,
          PCSrc => PCSrc,
          PCWrite => PCWrite,
          RegDst => RegDst,
          Branch => Branch,
          MemtoReg => MemtoReg,
          ALUCtrl => ALUCtrl,
          MemWrite => MemWrite,
          IorD => IorD,
          IRWrite => IRWrite,
          ALUSrcA => ALUSrcA,
          ALUSrcB => ALUSrcB,
          RegWrite => RegWrite
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		-- R-Type Test
		Op <= "000000";
		Funct <= "100100";
		wait for 20 ns;

		-- Branch Test
		Op <= "000100";
		Funct <= "000000";
		wait for 20 ns;

		-- Jump Test
		Op <= "000010";
		Funct <= "000000";
		wait for 20 ns;

		-- Load/Store Test
		Op <= "101011";
		Funct <= "000000";
		wait for 20 ns;
		
      wait;
   end process;

END;
