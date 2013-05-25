----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:35 01/31/2013 
-- Design Name: 
-- Module Name:    Dec1to2 - Behavioral 
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

entity Dec1to2 is
port(
	en : in STD_LOGIC;
	input : in STD_LOGIC;
	output : out STD_LOGIC_VECTOR(1 downto 0)
	);
end Dec1to2;

architecture Behavioral of Dec1to2 is
begin
output(0) <= not input and en;
output(1) <= input and en;
end Behavioral;

