--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:59:30 05/19/2023
-- Design Name:   
-- Module Name:   C:/ISE/Projects/FPGA/MidProj/MCProcessor/RegFile_TB.vhd
-- Project Name:  MCProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegFile
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
 
ENTITY RegFile_TB IS
END RegFile_TB;
 
ARCHITECTURE behavior OF RegFile_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegFile
    PORT(
         readreg1 : IN  std_logic_vector(4 downto 0);
         readreg2 : IN  std_logic_vector(4 downto 0);
         writereg : IN  std_logic_vector(4 downto 0);
         writedata : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         RegWrite : IN  std_logic;
         readdata1 : OUT  std_logic_vector(31 downto 0);
         readdata2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal readreg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal readreg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal writereg : std_logic_vector(4 downto 0) := (others => '0');
   signal writedata : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal RegWrite : std_logic := '0';

 	--Outputs
   signal readdata1 : std_logic_vector(31 downto 0);
   signal readdata2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 2.5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegFile PORT MAP (
          readreg1 => readreg1,
          readreg2 => readreg2,
          writereg => writereg,
          writedata => writedata,
          clk => clk,
          RegWrite => RegWrite,
          readdata1 => readdata1,
          readdata2 => readdata2
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
      wait for 100 ns;	

			readreg1 <= "00001"; 
			readreg2 <= "00010"; 
			writereg <= "00011"; 
			writedata <= x"00000006"; 
			RegWrite<= '0'; 
			wait for 50 ns; 
			RegWrite <= '1'; 
			wait for 50 ns; 

      wait for clk_period*10;

      wait;
   end process;

END;
