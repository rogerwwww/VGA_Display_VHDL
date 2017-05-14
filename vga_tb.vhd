library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity vga_tb is
end vga_tb;

architecture rtl of vga_tb is
component vga_disp
	Port ( 
      clk50       : in  STD_LOGIC;
	  vga_state	  : in  STD_LOGIC;
	  vga_shift	  : in  STD_LOGIC;
      vga_red     : out STD_LOGIC;
      vga_green   : out STD_LOGIC;
      vga_blue    : out STD_LOGIC;
      vga_hsync   : out STD_LOGIC;
      vga_vsync   : out STD_LOGIC
    );
end component;

signal clk50 : std_logic:='0';
signal vga_state: std_logic:='1';
signal vga_shift: std_logic:='0';
signal vga_red: std_logic;
signal vga_green: std_logic;
signal vga_blue: std_logic;
signal vga_hsync: std_logic;
signal vga_vsync: std_logic;
constant clk_period : time := 2 ns;

begin
	
instant : vga_disp
	port map (clk50=>clk50, vga_state=>vga_state, vga_shift=>vga_shift, vga_red=>vga_red, vga_green=>vga_green, vga_blue=>vga_blue, vga_hsync=>vga_hsync, vga_vsync=>vga_vsync);

clk_gen:process
begin
	wait for clk_period/2;
	clk50<='1';
	wait for clk_period/2;
	clk50<='0';
end process;

state_gen:process
begin
	wait for 100 ns;
	vga_state<='0';
	wait for 100 ns;
	vga_state<='1';
end process;

end rtl;