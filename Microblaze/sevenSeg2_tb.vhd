library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSeg2_tb is
--  Port ( );
end sevenSeg2_tb;

architecture Behavioral of sevenSeg2_tb is

component sevenSeg2_block_wrapper is
  port (
    clk_100MHZ : in STD_LOGIC;
    gpio_io_o_0 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    reset : in STD_LOGIC
  );
  end component sevenSeg2_block_wrapper;

      signal clk_100MHZ : STD_LOGIC;
      signal reset : STD_LOGIC;
      signal gpio_io_o_0 : STD_LOGIC_VECTOR ( 9 downto 0 );
      
      -- Clock Period
      constant clk_period : time := 10 ns; 
  
begin
uut: component sevenSeg2_block_wrapper
     port map (
      gpio_io_o_0(9 downto 0) => gpio_io_o_0(9 downto 0),
      clk_100MHZ => clk_100MHZ,
      reset => reset
    );

     clk_process : process
     begin
        clk_100MHZ <= '0';
        
        wait for clk_period/2;
        clk_100MHZ <= '1';
        
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