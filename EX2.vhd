----------------------------------------------------------------------------------
-- Company: Rutgers
-- Engineer: Brian Alden
-- 
-- Create Date: 02/20/2019 10:45:27 PM
-- Design Name: 
-- Module Name: EX2 - Behavioral
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

entity EX2 is
    Port ( X,Y,Z : in  std_logic_vector (7 downto 0);
              MS : in  std_logic_vector (1 downto 0);
          DS,CLK : in  std_logic;
           RA,RB : out std_logic_vector (7 downto 0));
end EX2;

architecture Structural of EX2 is
    -- component declaration
    component mux4t1                                                      
        port (in3, in2, in1, in0 : in  std_logic_vector (7 downto 0);
                           M_SEL : in  std_logic_vector (1 downto 0);
                           M_out : out std_logic_vector (7 downto 0));
    end component;

    component reg8FE 
        port (  REG_IN  : in  std_logic_vector (7 downto 0);
                LD, CLK : in  std_logic;
                REG_OUT : out std_logic_vector (7 downto 0));
    end component;

    component decoder 
        Port ( D_in : in std_logic;
             D0, D1 : out std_logic);
    end component;

    -- intermediate signal decloration
    signal RegA_out, RegB_out, MUX_out_sig : std_logic_vector (7 downto 0);
    signal D0_sig, D1_sig : std_logic;
           
begin

    mux1 : mux4t1 port map ( in3   => X,
                             in2   => Y,
                             in1   => Z,
                             in0   => RegB_out,
                             M_SEL => MS,
                             M_out => MUX_out_sig);
                             
    REG_A : reg8FE port map ( REG_IN  => MUX_out_sig,
                              LD      => D0_sig,
                              CLK     => CLK,
                              REG_OUT => RegA_out);  
                              
                              RA <= RegA_out;
                           
    REG_B : reg8FE port map ( REG_IN  => RegA_out,
                              LD      => D1_sig,
                              CLK     => CLK,
                              REG_OUT => RegB_out); 
                              
                              RB <= RegB_out;
                             
    Dec1t2 : decoder port map ( D_in => DS,
                                D0   => D0_sig,
                                D1   => D1_sig);              

end Structural;
