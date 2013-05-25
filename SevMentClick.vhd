----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:46:25 01/30/2013 
-- Design Name: 
-- Module Name:    SevMentClick - Behavioral 
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

entity SevMentClick is
	port (
		switch : in STD_LOGIC_VECTOR(7 downto 0);
		segments : out STD_LOGIC_VECTOR( 7 downto 0);
		option : in STD_LOGIC_VECTOR(3 downto 0);
		router : out STD_LOGIC_VECTOR(3 downto 0)
		);
end SevMentClick;

architecture Behavioral of SevMentClick is

begin
	segments(0) <= not switch(0);
	segments(1) <= not switch(1);
	segments(2) <= not switch(2);
	segments(3) <= not switch(3);
	segments(4) <= not switch(4);
	segments(5) <= not switch(5);
	segments(6) <= not switch(6);
	segments(7) <= not switch(7);
	router(0) <= not option(0);
	router(1) <= not option(1);
	router(2) <= not option(2);
	router(3) <= not option(3);
end Behavioral;

