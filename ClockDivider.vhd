----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:05 02/11/2013 
-- Design Name: 
-- Module Name:    ClockDivider - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clkdiv is
	port(
		mclk : in STD_LOGIC;
		clk1,clk2 : out STD_LOGIC);
end clkdiv;

architecture clkdiv of clkdiv is
signal q : STD_LOGIC_VECTOR(23 downto 0);
begin
	process(mclk)
	begin
	if mclk'event and mclk = '1' then
		q <= q + 1;
	end if;
	end process;
	clk1 <= q(15);
	clk2 <= q(23);
end clkdiv;
