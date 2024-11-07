--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:09:19 05/19/2023
-- Design Name:   
-- Module Name:   C:/ISE/Projects/FPGA/MidProj/MCProcessor/ALU_TB.vhd
-- Project Name:  MCProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         SrcA : IN  std_logic_vector(31 downto 0);
         SrcB : IN  std_logic_vector(31 downto 0);
         ALUctrl : IN  std_logic_vector(3 downto 0);
         ALUResult : OUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SrcA : std_logic_vector(31 downto 0) := (others => '0');
   signal SrcB : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUctrl : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   signal zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 2.5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          SrcA => SrcA,
          SrcB => SrcB,
          ALUctrl => ALUctrl,
          ALUResult => ALUResult,
          zero => zero
        );

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	
--      wait for 100 ns;	
--      wait for 100 ns;	

    --  wait for <clock>_period*10;

      -- insert stimulus here 
		
		wait for 50 ns; 
		SrCA <= ("00000000000000000000000000000111"); 
		SrcB <= ("00000000000000000000000000000001"); 
		ALUCtrl <= "0000";
		wait for 50 ns; 
		ALUCtrl <= "0001";
		wait for 50 ns;
		ALUCtrl <= "0010";
		wait for 50 ns;
		ALUCtrl <= "0011";
		wait for 50 ns;
		ALUCtrl <= "0100";
		wait for 50 ns;
		ALUCtrl <= "0101";
		wait for 50 ns;
		ALUCtrl <= "1011";
		wait for 50 ns;
		ALUCtrl <= "1000";
		wait for 50 ns;
		ALUCtrl <= "1001";
		wait for 50 ns;
		ALUCtrl <= "1010";
		wait for 50 ns;
		ALUCtrl <= "1100";
		wait for 50 ns;
		ALUCtrl <= "1101";
		wait for 50 ns;
		ALUCtrl <= "0111";
		wait for 50 ns;
		ALUCtrl <= "0110";
		wait for 50 ns;

      wait;
   end process;

END;
