-------------------------------------------------------------------------------
-- Title      : Dot Matrix Character Rom
-------------------------------------------------------------------------------
-- File       : character_rom.vhd
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

entity character_rom is

  port (
    ascii_in  : in  std_logic_vector(6 downto 0);
    dot_array : out dot_matrix_arry_t
    );

end entity character_rom;


architecture behavior of character_rom is


  type ascii_rom_arry is array (0 to 127) of dot_matrix_arry_t;
  signal ascii_rom : ascii_rom_arry := (
    48 => ("01110",
           "10001",
           "10011",
           "10101",
           "11001",
           "10001",
           "01110"),

    49 => ("00100",
           "01100",
           "00100",
           "00100",
           "00100",
           "00100",
           "01110"),

    50 => ("01110",
           "10001",
           "00001",
           "00110",
           "01000",
           "10000",
           "11111"),

    51 => ("01110",
           "10001",
           "00001",
           "00110",
           "00001",
           "10001",
           "01110"),
    --Characters not yet defined
    others => ("01010",
               "10101",
               "01010",
               "10101",
               "01010",
               "10101",
               "01010")
    );






begin  -- architecture behavior


  process (ascii_in) is
    variable ascii_in_natural : natural;
  begin  -- process
    ascii_in_natural := to_integer(unsigned(ascii_in));
    dot_array        <= ascii_rom(ascii_in_natural);
  end process;



end architecture behavior;
