-------------------------------------------------------------------------------
-- Title      : Dot Matrix Display Output Raster 
-------------------------------------------------------------------------------
-- File       : dot_matrix_driver.vhd
-- Author     : Ashton Johnson  <ashtonchase@users.noreply.github.com>
-- Created    : 2016-12-21
-- Last update: 2016-12-21
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module will rater through each of the 35 dots to to
-- properly drive them one at a time.
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

entity dot_matrix_output_raster is
  port (
    clk          : in     std_logic;
    input_strobe : in     std_logic;
    input        : in     dot_matrix_arry_t;
    -- Column pins (anode)
    column       : buffer std_logic_vector(0 to NUM_COLUMNS-1);
    -- Row pins (cathode)
    row          : buffer std_logic_vector(0 to NUM_ROWS-1)
    );

end entity dot_matrix_output_raster;

architecture behavior of dot_matrix_output_raster is

begin  -- architecture behavior

  

end architecture behavior;
