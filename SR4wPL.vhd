----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:24:49 02/11/2013 
-- Design Name: 
-- Module Name:    SR8Bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SR11wPL is
	port(
		data_in : in STD_LOGIC;
		clk : in STD_LOGIC;
		selector: in STD_LOGIC_VECTOR(1 downto 0);
		output : out STD_LOGIC_VECTOR(10 downto 0)
	);
end SR11wPL;

architecture Behavioral of SR11wPL is
signal qs : STD_LOGIC_VECTOR(10 downto 0) := "11111111111";
signal transite : STD_LOGIC;
begin
	process(clk)
	begin
	if clk'event and clk  = '1' then
		if selector="00" then
			qs <= "11111111111";
		elsif selector="01" then
			transite <= qs(0);
			qs(9 downto 0) <= qs(10 downto 1);
			qs(10) <= transite;
		elsif selector="10" then
			transite <= qs(10);
			qs(10 downto 1) <= qs(9 downto 0);
			qs(0) <= transite;
		elsif selector="11" then
			qs(10 downto 1) <= qs(9 downto 0);
			qs(0) <= data_in;
		end if;
	end if;
	output <= qs;
	end process;
end Behavioral;

