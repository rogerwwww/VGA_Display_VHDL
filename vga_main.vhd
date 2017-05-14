library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity vga_top is
	port(
		clk12		: in  std_logic;
		state_button: in  std_logic;
		shift_button: in  std_logic;
		vga_red		: out std_logic;
		vga_green	: out STD_LOGIC;
		vga_blue    : out STD_LOGIC;
		vga_hsync   : out STD_LOGIC;
		vga_vsync   : out STD_LOGIC
	);
end vga_top;

architecture behavoir of vga_top is
component vga_disp
	port(
	  clk50       : in  STD_LOGIC;
	  vga_state   : in  STD_LOGIC;
	  vga_shift   : in  STD_LOGIC;
      vga_red     : out STD_LOGIC;
      vga_green   : out STD_LOGIC;
      vga_blue    : out STD_LOGIC;
      vga_hsync   : out STD_LOGIC;
      vga_vsync   : out STD_LOGIC
      --frame_addr  : out STD_LOGIC_VECTOR(14 downto 0);
      --frame_pixel : in  STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

component pll_module
    port (CLKI: in  std_logic; CLKOP: out  std_logic);
end component; 

component button_as_switch_nodist
    port(
		clk  : in  std_logic;
		inp  : in  std_logic;
		outp : buffer std_logic
	);
end component; 	

signal clk50 : std_logic;
signal vga_state : std_logic;
signal vga_shift : std_logic;

begin
pll : pll_module
    port map (CLKI=>clk12, CLKOP=>clk50);
	
vga : vga_disp
	port map (clk50=>clk50, vga_state=>vga_state, vga_shift=>vga_shift, vga_red=>vga_red, vga_green=>vga_green, vga_blue=>vga_blue, vga_hsync=>vga_hsync, vga_vsync=>vga_vsync);

state_inp : button_as_switch_nodist
	port map (clk=>clk12, inp=>state_button, outp=>vga_state);
	
shift_inp : button_as_switch_nodist
	port map (clk=>clk12, inp=>shift_button, outp=>vga_shift);
	
end behavoir;