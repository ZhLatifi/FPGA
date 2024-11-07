--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:17:31 05/19/2023
-- Design Name:   
-- Module Name:   C:/ISE/Projects/FPGA/MidProj/MCProcessor/MCP_Top_TB.vhd
-- Project Name:  MCProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MCProcessor
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
 
ENTITY MCP_Top_TB IS
END MCP_Top_TB;
 
ARCHITECTURE behavior OF MCP_Top_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MCProcessor
    PORT(
         clk : IN  std_logic;
         FB : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal FB : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant period : time := 2.5 ns;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MCProcessor PORT MAP (
          clk => clk,
          FB => FB
        );

   -- Clock process definitions
   clk_process :process
   begin
		for i in 1 to 100 loop
			clk 			<= '0';
			wait for period/2;
			clk 			<= '1';
			wait for period/2;
		end loop;
	wait;
   end process;


END;
