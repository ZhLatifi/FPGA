----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 07:06:01 PM
-- Design Name: 
-- Module Name: MBT_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MBT_tb is
--  Port ( );
end MBT_tb;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MBT_TB is
--  Port ( );
end MBT_TB;

architecture Behavioral of MBT_TB is

component MBT_block_wrapper is
  port (
    clk_in1_0 : in STD_LOGIC;
    gpio_io_o_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    reset : in STD_LOGIC
  );
  end component MBT_block_wrapper;

      signal clk_in1_0 : STD_LOGIC;
      signal reset : STD_LOGIC;
      signal gpio_io_o_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
      
      -- Clock Period
      constant clk_period : time := 10 ns; 
  
begin
uut: component MBT_block_wrapper
     port map (
      gpio_io_o_0(31 downto 0) => gpio_io_o_0(31 downto 0),
      clk_in1_0 => clk_in1_0,
      reset => reset
    );

     clk_process : process
     begin
        clk_in1_0 <= '0';
        
        wait for clk_period/2;
        clk_in1_0 <= '1';
        
        wait for clk_period/2;
     end process clk_process;
     
     
     stimulus_process : process
     begin
        reset <= '1';
        wait for 100 ns;
                
        reset <= '0';
        wait;
--        wait for 100 ns;
        
--        reset <= '1';
--        wait for 100 ns;
        
--        reset <= '1';
--        wait for 100 ns;

     end process stimulus_process;


end Behavioral;
