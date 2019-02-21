----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2019 01:35:21 AM
-- Design Name: 
-- Module Name: EX3 - Structural
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

entity EX3 is
    Port ( LDB, LDA    : in  std_logic;
           S1, S0, CLK : in  std_logic;
           X, Y        : in  std_logic_vector (7 downto 0);
           RB          : out std_logic_vector (7 downto 0));
end EX3;

architecture Structural of EX3 is
    -- component declaration
    component mux2t1 
        Port ( in1, in0 : in  std_logic_vector (7 downto 0);
               M_SEL    : in  std_logic;
               M_out    : out std_logic_vector (7 downto 0));
    end component;

    component reg8 
        port (  REG_IN  : in  std_logic_vector (7 downto 0);
                LD, CLK : in  std_logic;
                REG_OUT : out std_logic_vector (7 downto 0));
    end component;

    -- intermediate signal decloration
    signal RegA_out, RegB_out, MUX1_out_sig, MUX2_out_sig : std_logic_vector (7 downto 0);
    
begin
    MUX1 : mux2t1 port map ( in1   => X,
                             in0   => RegB_out,
                             M_SEL => S1,
                             M_out => MUX1_out_sig);
                             
    MUX2 : mux2t1 port map ( in1   => RegA_out,
                             in0   => Y,
                             M_SEL => S0,
                             M_out => MUX2_out_sig);
                             
    REG_A : reg8  port map ( REG_IN  => MUX1_out_sig,
                              LD      => LDA,
                              CLK     => CLK,
                              REG_OUT => RegA_out);  
                           
    REG_B : reg8  port map ( REG_IN  => MUX2_out_sig,
                              LD      => LDB,
                              CLK     => CLK,
                              REG_OUT => RegB_out);
                              
   RB <= RegB_out;                            

end Structural;
