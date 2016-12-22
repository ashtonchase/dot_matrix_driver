
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package dot_matrix_pkg is

  constant NUM_ROWS    : positive := 7;
  constant NUM_COLUMNS : positive := 5;

  subtype slv is std_logic_vector;

  type dot_matrix_arry_t is array (0 to NUM_ROWS-1) of std_logic_vector(0 to NUM_COLUMNS-1);


end package dot_matrix_pkg;
