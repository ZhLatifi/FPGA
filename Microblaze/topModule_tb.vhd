----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 06/06/2023 10:05:13 PM
-- Design Name:
-- Module Name: MB_ecg_final_tb - Behavioral
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
use ieee.std_logic_textio.all;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity topModule_tb is
-- Port ( );
end topModule_tb;
architecture Behavioral of topModule_tb is
component topModule_block_wrapper
port (
ap_ctrl_0_done : out STD_LOGIC;
ap_ctrl_0_idle : out STD_LOGIC;
ap_ctrl_0_ready : out STD_LOGIC;
ap_ctrl_0_start : in STD_LOGIC ;
ap_ctrl_1_done : out STD_LOGIC;
ap_ctrl_1_idle : out STD_LOGIC;
ap_ctrl_1_ready : out STD_LOGIC;
ap_ctrl_1_start : in STD_LOGIC ;
clk_100MHz : in STD_LOGIC ;
fs_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
gpio_io_o_0 : out STD_LOGIC_VECTOR ( 9 downto 0 );
reset : in STD_LOGIC ;
s10_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s11_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s12_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s13_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s14_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s15_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s16_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s17_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s18_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s19_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s1_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s20_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s2_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s3_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s4_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s5_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s6_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s7_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s8_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
s9_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
threshold_0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
);
end component;
signal ap_ctrl_0_done : STD_LOGIC;
signal ap_ctrl_0_idle : STD_LOGIC;
signal ap_ctrl_0_ready : STD_LOGIC;
signal ap_ctrl_0_start : STD_LOGIC := '0';
signal ap_ctrl_1_done : STD_LOGIC;
signal ap_ctrl_1_idle : STD_LOGIC;
signal ap_ctrl_1_ready : STD_LOGIC;
signal ap_ctrl_1_start : STD_LOGIC := '0';
signal clk_100MHz : STD_LOGIC := '0';
signal fs_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
signal gpio_io_o_0 : STD_LOGIC_VECTOR ( 9 downto 0 );
signal reset : STD_LOGIC := '0';
signal s10_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s11_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s12_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s13_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s14_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s15_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s16_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s17_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s18_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s19_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s1_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s20_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s2_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s3_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s4_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s5_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s6_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s7_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s8_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal s9_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
signal threshold_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
constant clk_period : time := 10 ns;
begin
uut: component topModule_block_wrapper
port map (
ap_ctrl_0_done => ap_ctrl_0_done,
ap_ctrl_0_idle => ap_ctrl_0_idle,
ap_ctrl_0_ready => ap_ctrl_0_ready,
ap_ctrl_0_start => ap_ctrl_0_start,
ap_ctrl_1_done => ap_ctrl_1_done,
ap_ctrl_1_idle => ap_ctrl_1_idle,
ap_ctrl_1_ready => ap_ctrl_1_ready,
ap_ctrl_1_start => ap_ctrl_1_start,
clk_100MHz => clk_100MHz,
fs_0(31 downto 0) => fs_0(31 downto 0),
gpio_io_o_0(9 downto 0) => gpio_io_o_0(9 downto 0),
reset => reset,
s10_0(7 downto 0) => s10_0(7 downto 0),
s11_0(7 downto 0) => s11_0(7 downto 0),
s12_0(7 downto 0) => s12_0(7 downto 0),
s13_0(7 downto 0) => s13_0(7 downto 0),
s14_0(7 downto 0) => s14_0(7 downto 0),
s15_0(7 downto 0) => s15_0(7 downto 0),
s16_0(7 downto 0) => s16_0(7 downto 0),
s17_0(7 downto 0) => s17_0(7 downto 0),
s18_0(7 downto 0) => s18_0(7 downto 0),
s19_0(7 downto 0) => s19_0(7 downto 0),
s1_0(7 downto 0) => s1_0(7 downto 0),
s20_0(7 downto 0) => s20_0(7 downto 0),
s2_0(7 downto 0) => s2_0(7 downto 0),
s3_0(7 downto 0) => s3_0(7 downto 0),
s4_0(7 downto 0) => s4_0(7 downto 0),
s5_0(7 downto 0) => s5_0(7 downto 0),
s6_0(7 downto 0) => s6_0(7 downto 0),
s7_0(7 downto 0) => s7_0(7 downto 0),
s8_0(7 downto 0) => s8_0(7 downto 0),
s9_0(7 downto 0) => s9_0(7 downto 0),
threshold_0(7 downto 0) => threshold_0(7 downto 0)
);
-- Clock process definitions
clk_process : process
begin
clk_100MHz <= '0';
wait for clk_period/2;
clk_100MHz <= '1';
wait for clk_period/2;
end process clk_process;
-- Stimulus process
stimulus_process : process
begin
reset <= '1';
wait for 100 ns;
reset <= '0';
wait;
end process stimulus_process;
control_process : process
begin

threshold_0 <= (others => '0');
fs_0 <= (others => '0');
wait for 100 ns;
-- Apply stimulus values

threshold_0 <= x"7F";
fs_0 <= x"00000014";
wait;
end process control_process;
-- Start the operation
operation_process : process
begin
ap_ctrl_0_start <= '1';
wait for 100 ns;
-- Wait for the operation to complete
wait until ap_ctrl_0_done = '1';
-- wait for 100 ns;
ap_ctrl_0_start <= '0';
ap_ctrl_1_start <= '1';
wait for 100 ns;
wait until ap_ctrl_1_done = '1';
ap_ctrl_1_start <= '0';
wait;
end process operation_process;
p_read : process(clk_100MHz, reset)
constant NUM_COL : integer := 20; -- number of column of file
type t_integer_array is array(integer range <> ) of integer;
file test_vector : text open read_mode is "C:/Users/USER/Desktop/ECG.txt";
variable row : line;
variable v_data_read : t_integer_array(1 to NUM_COL);
variable v_data_row_counter : integer := 0;
begin
if(falling_edge(reset)) then
-- read from input file in "row" variable
if(not endfile(test_vector)) then
v_data_row_counter := v_data_row_counter + 1;
readline(test_vector,row);
end if;
-- read integer number from "row" variable in integer array
for kk in 1 to NUM_COL loop
read(row,v_data_read(kk));
end loop;
s10_0 <= std_logic_vector(to_unsigned(v_data_read(10), 8));
s1_0 <= std_logic_vector(to_unsigned(v_data_read(1), 8));
s2_0 <= std_logic_vector(to_unsigned(v_data_read(2), 8));
s3_0 <= std_logic_vector(to_unsigned(v_data_read(3), 8));
s4_0 <= std_logic_vector(to_unsigned(v_data_read(4), 8));
s5_0 <= std_logic_vector(to_unsigned(v_data_read(5), 8));
s6_0 <= std_logic_vector(to_unsigned(v_data_read(6), 8));
s7_0 <= std_logic_vector(to_unsigned(v_data_read(7), 8));
s8_0 <= std_logic_vector(to_unsigned(v_data_read(8), 8));
s9_0 <= std_logic_vector(to_unsigned(v_data_read(9), 8));
s20_0 <= std_logic_vector(to_unsigned(v_data_read(20), 8));
s11_0 <= std_logic_vector(to_unsigned(v_data_read(11), 8));
s12_0 <= std_logic_vector(to_unsigned(v_data_read(12), 8));
s13_0 <= std_logic_vector(to_unsigned(v_data_read(13), 8));
s14_0 <= std_logic_vector(to_unsigned(v_data_read(14), 8));
s15_0 <= std_logic_vector(to_unsigned(v_data_read(15), 8));
s16_0 <= std_logic_vector(to_unsigned(v_data_read(16), 8));
s17_0 <= std_logic_vector(to_unsigned(v_data_read(17), 8));
s18_0 <= std_logic_vector(to_unsigned(v_data_read(18), 8));
s19_0 <= std_logic_vector(to_unsigned(v_data_read(19), 8));
end if;
end process p_read;
end Behavioral;

