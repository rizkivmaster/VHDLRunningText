----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:35:37 01/31/2013 
-- Design Name: 
-- Module Name:    Dec2to4 - Behavioral 
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

entity Dec2to4 is
	port(
		en : in STD_LOGIC;
		input : in STD_LOGIC_VECTOR(1 downto 0);
		output : out STD_LOGIC_VECTOR(3 downto 0)
	);
end Dec2to4;

architecture Behavioral of Dec2to4 is
signal u,v : STD_LOGIC;
component Dec1to2 is
port(
	en : in STD_LOGIC;
	input : in STD_LOGIC;
	output : out STD_LOGIC_VECTOR(1 downto 0)
	);
	end component;
begin
	D1 : Dec1to2
	port map(
		en => en,
		input => input(1),
		output(0) => u,
		output(1) => v
		);
	D2 : Dec1to2
	port map(
		en => u,
		input => input(0),
		output(0) => output(0),
		output(1) => output(1)
		);
	D3 : Dec1to2
	port map(
		en => v,
		input => input(0),
		output(0) => output(2),
		output(1) => output(3)
		);
end Behavioral;

