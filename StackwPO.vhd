----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:47:14 02/11/2013 
-- Design Name: 
-- Module Name:    Stack - Behavioral 
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

entity StackwPO is
port(
	input : in STD_LOGIC_VECTOR(3 downto 0);
	selector : in STD_LOGIC_VECTOR(1 downto 0);
	clk : in STD_LOGIC;
	output : out STD_LOGIC_VECTOR(15 downto 0));
end StackwPO;

architecture Behavioral of StackwPO is
component SR11wPL is
port(
		data_in : in STD_LOGIC;
		clk : in STD_LOGIC;
		selector: in STD_LOGIC_VECTOR(1 downto 0);
		output : out STD_LOGIC_VECTOR(10 downto 0));
end component;
signal outsel : STD_LOGIC_VECTOR(43 downto 0);
begin
	reg0 : SR11wPL port map(input(0),clk,selector,outsel(10 downto 0));
	reg1 : SR11wPL port map(input(1),clk,selector,outsel(21 downto 11));
	reg2 : SR11wPL port map(input(2),clk,selector,outsel(32 downto 22));
	reg3 : SR11wPL port map(input(3),clk,selector,outsel(43 downto 33));
	output(3 downto 0) <= outsel(3 downto 0);
	output(7 downto 4) <= outsel(14 downto 11);
	output(11 downto 8) <= outsel(25 downto 22);
	output(15 downto 12) <= outsel(36 downto 33);
end Behavioral;

