----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:36:54 05/24/2013 
-- Design Name: 
-- Module Name:    RunMain - Behavioral 
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

entity RunMain is
port(
	input : in STD_LOGIC_VECTOR(3 downto 0);
	selector : in STD_LOGIC_VECTOR(1 downto 0);
	clk :in STD_LOGIC;
	toggle : in STD_LOGIC;
	interface : out STD_LOGIC_VECTOR(6 downto 0);
	an : out STD_LOGIC_VECToR(3 downto 0));
end RunMain;

architecture Behavioral of RunMain is
component SevSegInt is
port(
	input : in STD_LOGIC_VECTOR(15 downto 0);
	clk : in STD_LOGIC;
	an : out STD_LOGIC_VECTOR(3 downto 0);
	output : out STD_LOGIC_VECTOR(6 downto 0));
end component;
component StackwPO is
port(
	input : in STD_LOGIC_VECTOR(3 downto 0);
	selector : in STD_LOGIC_VECTOR(1 downto 0);
	clk : in STD_LOGIC;
	output : out STD_LOGIC_VECTOR(15 downto 0));
end component;
component clkdiv is
	port(
		mclk : in STD_LOGIC;
		clk1,clk2 : out STD_LOGIC);
end component;
component Multiplexer2bit is
port(
		input0 : in STD_LOGIC;
		input1 : in STD_LOGIC;
		selector : in STD_LOGIC;
		output : out STD_LOGIC
		);
end component;
signal u : STD_LOGIC_VECTOR(15 downto 0);
signal bclk,cclk : STD_LOGIC;
signal pseudoclock : STD_LOGIC;
signal pseudoselector : STD_LOGIC;
begin

-- buat pembagi clock
clksrc : clkdiv port map(clk,cclk,bclk);

-- buat register
stack : StackwPO port map (input,selector,pseudoclock,u);

-- buat penampil seven segment
int : SevSegInt port map(u,cclk,an,interface);

-- buat selector clock
pseudoselector <= selector(0) xor selector(1);
pse : Multiplexer2bit port map (toggle,bclk,pseudoselector,pseudoclock);

end Behavioral;

