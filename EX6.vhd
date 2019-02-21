----------------------------------------------------------------------------------
-- Company: Rutgers
-- Engineer: Brian Alden
-- 
-- Create Date: 02/21/2019 02:51:26 AM
-- Design Name: 
-- Module Name: EX6 - Structural
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

entity EX6 is
    Port ( A, B, C  : in  std_logic_vector (7 downto 0);
      CLK, SEL1, SEL2 : in  std_logic;
           RAP, RBP : out std_logic_vector (7 downto 0));
end EX6;

architecture Structural of EX6 is
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
    
    component decoder 
        Port ( D_in : in std_logic;
             D0, D1 : out std_logic);
    end component;

    -- intermediate signal decloration
    signal MUX1_out_sig : std_logic_vector (7 downto 0);
    signal Dec_1, Dec_0 : std_logic;
begin
    MUX1 : mux2t1 port map ( in1   => A,
                             in0   => B,
                             M_SEL => SEL1,
                             M_out => MUX1_out_sig);
                             
    REG_A : reg8   port map ( REG_IN  => MUX1_out_sig,
                              LD      => Dec_1,
                              CLK     => CLK,
                              REG_OUT => RAP);  
                           
    REG_B : reg8   port map ( REG_IN  => C,
                              LD      => Dec_0,
                              CLK     => CLK,
                              REG_OUT => RBP);
                              
    Dec : decoder  port map ( D_in  => SEL2,
                              D0    => Dec_0,
                              D1    => Dec_1);
                              

end Structural;
