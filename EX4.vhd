----------------------------------------------------------------------------------
-- Company: Rutgers
-- Engineer: Brian Alden
-- 
-- Create Date: 02/21/2019 02:06:52 AM
-- Design Name: 
-- Module Name: EX4 - Structural
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

entity EX4 is
    Port ( LDA, LDB : in  std_logic;
           S0, S1   : in  std_logic;
           CLK, RD  : in  std_logic;
           X, Y     : in  std_logic_vector (7 downto 0);
           RA, RB   : out std_logic_vector (7 downto 0)); 

end EX4;

architecture Structural of EX4 is
    -- component declaration
    component mux2t1 
        Port ( in1, in0 : in  std_logic_vector (7 downto 0);
               M_SEL    : in  std_logic;
               M_out    : out std_logic_vector (7 downto 0));
    end component;

    component reg8FE 
        port (  REG_IN  : in  std_logic_vector (7 downto 0);
                LD, CLK : in  std_logic;
                REG_OUT : out std_logic_vector (7 downto 0));
    end component;

    -- intermediate signal decloration
    signal RegB_out, MUX1_out_sig, MUX2_out_sig : std_logic_vector (7 downto 0);
    signal AND_A, AND_B : std_logic;
    
begin

    AND_B <= LDB AND (NOT RD);
    AND_A <= LDA AND RD;

    MUX1 : mux2t1 port map ( in1   => X,
                             in0   => Y,
                             M_SEL => S1,
                             M_out => MUX1_out_sig);
                             
    MUX2 : mux2t1 port map ( in1   => RegB_out,
                             in0   => Y,
                             M_SEL => S0,
                             M_out => MUX2_out_sig);
                             
    REG_A : reg8FE  port map ( REG_IN  => MUX2_out_sig,
                              LD      => AND_A,
                              CLK     => CLK,
                              REG_OUT => RA);  
                           
    REG_B : reg8FE  port map ( REG_IN  => MUX1_out_sig,
                              LD      => AND_B,
                              CLK     => CLK,
                              REG_OUT => RegB_out);
                              
                              RB <= RegB_out;

end Structural;
