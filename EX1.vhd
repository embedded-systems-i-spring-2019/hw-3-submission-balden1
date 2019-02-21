----------------------------------------------------------------------------------
-- Company: Rutgers
-- Engineer: Brian Alden
-- 
-- Create Date: 02/20/2019 10:04:51 PM
-- Design Name: 
-- Module Name: EX1 - Behavioral
-- Project Name: HW3
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

entity EX1 is
  Port (A, B : in std_logic_vector (7 downto 0); --8 bit vector
        CLK, LDA, SEL : in std_logic; --single bit
        F : out std_logic_vector (7 downto 0)); --8 bit vector
end EX1;

architecture Behavioral of EX1 is
    -- intermediate signal of mux output to reg A
    signal mux_out : std_logic_vector ( 7 downto 0); 
begin
    REG_A: process (CLK) --process
    begin
        if (rising_edge(CLK)) then
            if (LDA = '1') then  --load enable
                F <= mux_out;
            end if;
        end if;
   end process;
   
   with SEL select  --mux selector
   mux_out <= A when '1',
              B when '0',
              (others => '0') when others;
end Behavioral;

            


