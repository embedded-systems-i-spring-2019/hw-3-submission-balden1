----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 11:20:50 PM
-- Design Name: 
-- Module Name: MUX4t1 - Behavioral
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

entity mux4t1 is                                                      --ENTITY MUX
    port (in3, in2, in1, in0 : in  std_logic_vector (7 downto 0);
                       M_SEL : in  std_logic_vector (1 downto 0);
                       M_out : out std_logic_vector (7 downto 0));
end mux4t1;
architecture behavioral of mux4t1 is                                     --ARCHITECTURE MUX
begin
    with M_SEL select
    M_out <= in3 when "00",
             in2 when "01",
             in1 when "10",
             in0 when "11",
             (others => '0') when others;
end behavioral;