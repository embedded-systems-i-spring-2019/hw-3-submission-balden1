----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 11:32:00 PM
-- Design Name: 
-- Module Name: reg8FE - Behavioral
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

entity reg8FE is
 port (  REG_IN  : in  std_logic_vector (7 downto 0);
            LD, CLK : in  std_logic;
            REG_OUT : out std_logic_vector (7 downto 0));
end reg8FE;

architecture Behavioral of reg8FE is

begin
  reg: process (CLK) 
    begin
        if (falling_edge (CLK)) then
            if (LD = '1') then
                REG_OUT <= REG_IN;
            end if;
        end if;
    end process;

end Behavioral;
