--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:02:53 05/19/2023
-- Design Name:   
-- Module Name:   C:/ISE/Projects/FPGA/MidProj/MCProcessor/ALUMUX_TB.vhd
-- Project Name:  MCProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUMUX
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
 
ENTITY ALUMUX_TB IS
END ALUMUX_TB;
 
ARCHITECTURE behavior OF ALUMUX_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUMUX
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         imm32 : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         ALUSrcA : IN  std_logic;
         ALUSrcB : IN  std_logic_vector(1 downto 0);
         SrcA : OUT  std_logic_vector(31 downto 0);
         SrcB : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal imm32 : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUSrcA : std_logic := '0';
   signal ALUSrcB : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal SrcA : std_logic_vector(31 downto 0);
   signal SrcB : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUMUX PORT MAP (
          A => A,
          B => B,
          imm32 => imm32,
          PC => PC,
          ALUSrcA => ALUSrcA,
          ALUSrcB => ALUSrcB,
          SrcA => SrcA,
          SrcB => SrcB
        );

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		
		A <= x"0000000F";
		PC   <= x"000000F0";
		imm32 <= x"FF000000";
		B <= x"00FF0000";
		wait for 10 ns;
		ALUSrcA <= '0';
		ALUSrcB <= "00";
		wait for 50 ns;
		ALUSrcA <= '1';
		ALUSrcB <= "10";
		wait for 50 ns;
		ALUSrcA <= '1';
		ALUSrcB <= "01";
		wait for 50 ns;
		ALUSrcA <= '0';
		ALUSrcB <= "11";
		wait for 50 ns;
		
      wait;
   end process;

END;
