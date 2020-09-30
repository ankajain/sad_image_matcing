--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:06:26 05/14/2014
-- Design Name:   
-- Module Name:   C:/Users/SHUBHAM JAIN/Documents/proj/proj/fj.vhd
-- Project Name:  proj
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sadcompleteripplecarypro
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fj IS
END fj;
 
ARCHITECTURE behavior OF fj IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sadcompleteripplecarypro
    PORT(
         lx0 : IN  std_logic_vector(7 downto 0);
         lx1 : IN  std_logic_vector(7 downto 0);
         lx2 : IN  std_logic_vector(7 downto 0);
         lx3 : IN  std_logic_vector(7 downto 0);
         lx4 : IN  std_logic_vector(7 downto 0);
         lx5 : IN  std_logic_vector(7 downto 0);
         lx6 : IN  std_logic_vector(7 downto 0);
         lx7 : IN  std_logic_vector(7 downto 0);
         lx8 : IN  std_logic_vector(7 downto 0);
         lx9 : IN  std_logic_vector(7 downto 0);
         lx10 : IN  std_logic_vector(7 downto 0);
         lx11 : IN  std_logic_vector(7 downto 0);
         lx12 : IN  std_logic_vector(7 downto 0);
         lx13 : IN  std_logic_vector(7 downto 0);
         lx14 : IN  std_logic_vector(7 downto 0);
         lx15 : IN  std_logic_vector(7 downto 0);
         ly0 : IN  std_logic_vector(7 downto 0);
         ly1 : IN  std_logic_vector(7 downto 0);
         ly2 : IN  std_logic_vector(7 downto 0);
         ly3 : IN  std_logic_vector(7 downto 0);
         ly4 : IN  std_logic_vector(7 downto 0);
         ly5 : IN  std_logic_vector(7 downto 0);
         ly6 : IN  std_logic_vector(7 downto 0);
         ly7 : IN  std_logic_vector(7 downto 0);
         ly8 : IN  std_logic_vector(7 downto 0);
         ly9 : IN  std_logic_vector(7 downto 0);
         ly10 : IN  std_logic_vector(7 downto 0);
         ly11 : IN  std_logic_vector(7 downto 0);
         ly12 : IN  std_logic_vector(7 downto 0);
         ly13 : IN  std_logic_vector(7 downto 0);
         ly14 : IN  std_logic_vector(7 downto 0);
         ly15 : IN  std_logic_vector(7 downto 0);
         lsum : OUT  std_logic_vector(11 downto 0);
         lcout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal lx0 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx1 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx2 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx3 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx4 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx5 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx6 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx7 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx8 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx9 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx10 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx11 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx12 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx13 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx14 : std_logic_vector(7 downto 0) := (others => '0');
   signal lx15 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly0 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly1 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly2 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly3 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly4 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly5 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly6 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly7 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly8 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly9 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly10 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly11 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly12 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly13 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly14 : std_logic_vector(7 downto 0) := (others => '0');
   signal ly15 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal lsum : std_logic_vector(11 downto 0);
   signal lcout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sadcompleteripplecarypro PORT MAP (
          lx0 => lx0,
          lx1 => lx1,
          lx2 => lx2,
          lx3 => lx3,
          lx4 => lx4,
          lx5 => lx5,
          lx6 => lx6,
          lx7 => lx7,
          lx8 => lx8,
          lx9 => lx9,
          lx10 => lx10,
          lx11 => lx11,
          lx12 => lx12,
          lx13 => lx13,
          lx14 => lx14,
          lx15 => lx15,
          ly0 => ly0,
          ly1 => ly1,
          ly2 => ly2,
          ly3 => ly3,
          ly4 => ly4,
          ly5 => ly5,
          ly6 => ly6,
          ly7 => ly7,
          ly8 => ly8,
          ly9 => ly9,
          ly10 => ly10,
          ly11 => ly11,
          ly12 => ly12,
          ly13 => ly13,
          ly14 => ly14,
          ly15 => ly15,
          lsum => lsum,
          lcout => lcout
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
