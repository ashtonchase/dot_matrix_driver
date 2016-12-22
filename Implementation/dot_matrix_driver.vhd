-------------------------------------------------------------------------------
-- Title      : Dot Matrix Display Driver
-------------------------------------------------------------------------------
-- File       : dot_matrix_driver.vhd
-- Author     : Ashton Johnson  <ashtonchase@users.noreply.github.com>
-- Created    : 2016-12-21
-- Last update: 2016-12-21
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module is intended to drive a 5x7 dot matrix display with
-- the supplied ascii characters. This was developed speciciall to drive the
-- LiteON LTP-305 series matrix displays
-------------------------------------------------------------------------------
-- MIT License

-- Copyright (c) 2016 Ashton Johnson

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-12-21  1.0      ashton  Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dot_matrix_pkg.all;


entity dot_matrix_driver is

  generic (
    clock_rate_hz   : positive := 10_000_000;
    refresh_rate_hz : positive := 30);

  port (
    -- Input clock
    clk        : in std_logic;
    -- Asynchronous reset
    arst       : in std_logic;
    -- ASCII input
    ascii_d    : in std_logic_vector(6 downto 0);
    -- ASCII data write enable
    ascii_wr : in std_logic;
    -- ASCII datga chip enable
    ascii_ce_n : in std_logic;
    -- lamp test, causes all dots to light at half brightness
    lt_n       : in std_logic;
    -- brightness
    -- 00=full brightness
    -- 01=1/7 brightness
    -- 10=1/2 brightness
    -- 11=full brightness
    bl_n       :    std_logic_vector(1 downto 0);



    ---------------------------------------------------------------------------
    -- DOT MATRIX OUPUTS
    ---------------------------------------------------------------------------
    -- Column pins (anode)
    column : buffer std_logic_vector(0 to NUM_COLUMNS-1);
    -- Row pins (cathode)
    row    : buffer std_logic_vector(0 to NUM_ROWS-1);
    -- Decimal point
    dp_c   : buffer std_logic;
    dp_a   : buffer std_logic
    );

end entity dot_matrix_driver;


architecture structural of dot_matrix_driver is

  constant ROW_UPDATE_RATE_HZ : positive := refresh_rate_hz*NUM_ROWS;

  signal input_strobe : std_logic;
  signal input        : dot_matrix_arry_t;
  signal dot_array    : dot_matrix_arry_t;
  signal ascii_d_ff   : std_logic_vector(ascii_d'range);


begin  -- architecture structural

  dot_matrix_output_raster_1 : entity work.dot_matrix_output_raster
    port map (
      clk          => clk,
      input_strobe => input_strobe,
      input        => dot_array,
      row          => row,
      column       => column);

  process (clk, arst) is
  begin  -- process    
    if clk'event and clk = '1' then  -- rising clock edge
      if ascii_wr = '1' then
        ascii_d_ff <= ascii_d;
      end if;
    end if;
  end process;

  character_rom_1 : entity work.character_rom
    port map (
      ascii_in  => ascii_d_ff,
      dot_array => dot_array);


end architecture structural;
