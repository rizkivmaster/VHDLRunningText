----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:14:34 02/15/2013 
-- Design Name: 
-- Module Name:    Counter2Bit - Behavioral 
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

entity Counter2Bit is
port(
	clk : in STD_LOGIC;
	output : out STD_LOGIC_VECTOR(1 downto 0));
end Counter2Bit;

architecture Behavioral of Counter2Bit is
signal u : STD_LOGIC_VECTOR(1 downto 0) := "00";
begin
	process(clk)
	begin 
	if clk'event and clk='1' then
		u <= u + 1;
	end if;
	end process;
	output <= u;
end Behavioral;

