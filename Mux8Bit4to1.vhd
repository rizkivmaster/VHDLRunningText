----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:17:30 02/15/2013 
-- Design Name: 
-- Module Name:    Mux8Bit4to1 - Behavioral 
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

entity SevSegInt is
port(
	input : in STD_LOGIC_VECTOR(15 downto 0);
	clk : in STD_LOGIC;
	an : out STD_LOGIC_VECTOR(3 downto 0);
	output : out STD_LOGIC_VECTOR(6 downto 0));
end SevSegInt;

architecture Behavioral of SevSegInt is
component SevSegConv is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (6 downto 0)
			  );
end component;
component Multiplexer4to1 is
port(
	input : in STD_LOGIC_VECTOR(3 downto 0);
	switch : in STD_LOGIC_VECTOR(1 downto 0);
	output : out STD_LOGIC
	);
end component;	
component Dec2to4 is
	port(
		en : in STD_LOGIC;
		input : in STD_LOGIC_VECTOR(1 downto 0);
		output : out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;
component Counter2Bit is
port(
	clk : in STD_LOGIC;
	output : out STD_LOGIC_VECTOR(1 downto 0));
end component;

signal hidup : STD_LOGIC;
signal negationen,u : STD_LOGIC_VECTOR(3 downto 0);
signal count : STD_LOGIC_VECTOR(1 downto 0);
begin
hidup <= '1';
cou : Counter2Bit port map(clk,count);
dec : Dec2to4 port map(hidup,count,negationen);
mux0 : Multiplexer4to1 port map( input(3 downto 0), count,u(0));
mux1 : Multiplexer4to1 port map( input(7 downto 4), count,u(1));
mux2 : Multiplexer4to1 port map( input(11 downto 8), count,u(2));
mux3 : Multiplexer4to1 port map( input(15 downto 12), count,u(3));
conv : SevSegConv port map(u,output);
an <= not negationen;
end Behavioral;

