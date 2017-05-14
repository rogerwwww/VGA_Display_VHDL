library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.ALL;

entity button_as_switch_nodist is
	port(
		clk  : in  std_logic;
		inp  : in  std_logic;
		outp : buffer std_logic
	);
end button_as_switch_nodist;

architecture botton_nodist of button_as_switch_nodist is
	signal delayCount : std_logic_vector(17 downto 0);
	signal lastFlag : std_logic := '0';
	signal setFlag : std_logic := '0';
begin
	process(inp)
	begin 
		if rising_edge(inp) then
			if delayCount = 0 then
				setFlag <= not setFlag;
			end if;
		end if;
	end process;
	
	process(clk)
	begin	
		if rising_edge(clk) then
			if setFlag /= lastFlag then
				delayCount <= (others => '1');
				lastFlag <= setFlag;
			end if;

			if delayCount /= 0 then
				if delayCount = 1 and inp = '1' then
					outp <= not outp;
					delayCount <= delayCount - 1;
				else
					delayCount <= delayCount - 1;
				end if;
			end if;
		end if;
	end process;
end botton_nodist;