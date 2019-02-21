----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 11:38:06 PM
-- Design Name: 
-- Module Name: mux2t1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2t1 is
    Port ( in1, in0 : in  std_logic_vector (7 downto 0);
           M_SEL    : in  std_logic;
           M_out    : out std_logic_vector (7 downto 0));
end mux2t1;

architecture Behavioral of mux2t1 is

begin
    with M_SEL select
    M_out <= in1 when '1',
             in0 when '0',
             (others => '0') when others;


end Behavioral;
