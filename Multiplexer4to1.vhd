----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:16:27 01/24/2013 
-- Design Name: 
-- Module Name:    Multiplexer4to1 - Behavioral 
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

entity Multiplexer4to1 is
port(
	input : in STD_LOGIC_VECTOR(3 downto 0);
	switch : in STD_LOGIC_VECTOR(1 downto 0);
	output : out STD_LOGIC
	);
end Multiplexer4to1;

architecture Behavioral of Multiplexer4to1 is
begin
	p1 : process(switch,input)
	begin
	case switch is
		when "00" => output <= input(0);
		when "01" => output <= input(1);
		when "10" => output <= input(2);
		when "11" => output <= input(3);
		when others => output <= input(0);
	end case;
	end process p1;
end Behavioral;

