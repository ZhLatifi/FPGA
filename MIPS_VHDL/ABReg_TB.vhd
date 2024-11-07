--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:55:08 05/19/2023
-- Design Name:   
-- Module Name:   C:/ISE/Projects/FPGA/MidProj/MCProcessor/ABReg_TB.vhd
-- Project Name:  MCProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ABreg
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
 
ENTITY ABReg_TB IS
END ABReg_TB;
 
ARCHITECTURE behavior OF ABReg_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ABreg
    PORT(
         readdata1 : IN  std_logic_vector(31 downto 0);
         readdata2 : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         A : OUT  std_logic_vector(31 downto 0);
         B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal readdata1 : std_logic_vector(31 downto 0) := (others => '0');
   signal readdata2 : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal A : std_logic_vector(31 downto 0);
   signal B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 2.5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ABreg PORT MAP (
          readdata1 => readdata1,
          readdata2 => readdata2,
          clk => clk,
          A => A,
          B => B
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
      wait for 50 ns;	
		
		readdata1 <= x"0000F0F0";
		readdata2 <= x"0F0F0000";
		wait for 50 ns;
		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
