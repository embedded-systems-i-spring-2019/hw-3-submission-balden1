----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 11:23:42 PM
-- Design Name: 
-- Module Name: Reg8 - Behavioral
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

entity reg8 is                                                        --ENTITY REGISTER
    port (  REG_IN  : in  std_logic_vector (7 downto 0);
            LD, CLK : in  std_logic;
            REG_OUT : out std_logic_vector (7 downto 0));
end reg8;

architecture Behavioral of Reg8 is

begin
    reg: process (CLK) 
    begin
        if (rising_edge (CLK)) then
            if (LD = '1') then
                REG_OUT <= REG_IN;
            end if;
        end if;
    end process;
end behavioral;




