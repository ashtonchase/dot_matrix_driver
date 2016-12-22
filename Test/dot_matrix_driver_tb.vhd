-------------------------------------------------------------------------------
-- Title      : Testbench for design "dot_matrix_driver"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dot_matrix_driver_tb.vhd
-- Author     : Ashton Johnson  <ashton@laptop>
-- Company    : 
-- Created    : 2016-12-21
-- Last update: 2016-12-21
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2016 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-12-21  1.0      ashton	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.dot_matrix_pkg.all;
-------------------------------------------------------------------------------

entity dot_matrix_driver_tb is

end entity dot_matrix_driver_tb;

-------------------------------------------------------------------------------

architecture test of dot_matrix_driver_tb is

  -- component generics
  constant clock_rate_hz   : positive := 10_000_000;
  constant refresh_rate_hz : positive := 30;

  -- component ports
  signal arst       : std_logic :='1';
  signal ascii_d    : std_logic_vector(6 downto 0) := 7X"30";
  signal ascii_wr : std_logic :='0';
  signal ascii_ce_n : std_logic;
  signal lt_n       : std_logic;
  signal bl_n       : std_logic_vector(1 downto 0);
  signal column     : std_logic_vector(0 to NUM_COLUMNS-1);
  signal row        : std_logic_vector(0 to NUM_ROWS-1);
  signal dp_c       : std_logic;
  signal dp_a       : std_logic;

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture test

  -- component instantiation
  DUT: entity work.dot_matrix_driver
    generic map (
      clock_rate_hz   => clock_rate_hz,
      refresh_rate_hz => refresh_rate_hz)
    port map (
      clk        => clk,
      arst       => arst,
      ascii_d    => ascii_d,
      ascii_wr => ascii_wr,
      ascii_ce_n => ascii_ce_n,
      lt_n       => lt_n,
      bl_n       => bl_n,
      column     => column,
      row        => row,
      dp_c       => dp_c,
      dp_a       => dp_a);

  -- clock generation
  Clk <= not Clk after 10 ns;
  arst <= '0' after 55 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    wait until arst = '0';
    wait until rising_edge(clk);
    ascii_wr<='1';
    wait until rising_edge(clk);
    ascii_wr<='0';
    wait;
  end process WaveGen_Proc;

  

end architecture test;

-------------------------------------------------------------------------------

configuration dot_matrix_driver_tb_test_cfg of dot_matrix_driver_tb is
  for test
  end for;
end dot_matrix_driver_tb_test_cfg;

-------------------------------------------------------------------------------
