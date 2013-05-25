----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:42:14 01/24/2013 
-- Design Name: 
-- Module Name:    Multiplexer2bit - Behavioral 
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

entity Multiplexer2bit is
	port(
		input0 : in STD_LOGIC;
		input1 : in STD_LOGIC;
		selector : in STD_LOGIC;
		output : out STD_LOGIC
		);
end Multiplexer2bit;

architecture Behavioral of Multiplexer2bit is

begin
	p1 : process(input0,input1,selector)
	begin 
		if selector='0' then
		output <= input0;
		else
		output <= input1;
		end if;
	end process p1;
end Behavioral;

