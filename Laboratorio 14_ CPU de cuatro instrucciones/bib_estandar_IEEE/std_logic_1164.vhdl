-- --------------------------------------------------------------------
--
--   Title     :  std_logic_1164 multi-value logic system
--   Library   :  This package shall be compiled into a library 
--             :  symbolically named IEEE.
--             :  
--   Developers:  IEEE model standards group (par 1164)
--   Purpose   :  This packages defines a standard for designers
--             :  to use in describing the interconnection data types
--             :  used in vhdl modeling.
--             : 
--   Limitation:  The logic system defined in this package may
--             :  be insufficient for modeling switched transistors,
--             :  since such a requirement is out of the scope of this
--             :  effort. Furthermore, mathematics, primitives,
--             :  timing standards, etc. are considered orthogonal
--             :  issues as it relates to this package and are therefore
--             :  beyond the scope of this effort.
--             :  
--   Note      :  No declarations or definitions shall be included in,
--             :  or excluded from this package. The "package declaration" 
--             :  defines the types, subtypes and declarations of 
--             :  std_logic_1164. The std_logic_1164 package body shall be 
--             :  considered the formal definition of the semantics of 
--             :  this package. Tool developers may choose to implement 
--             :  the package body in the most efficient manner available 
--             :  to them.
--             :
-- --------------------------------------------------------------------
--   modification history :
-- --------------------------------------------------------------------
--   Version: $Revision: 1.2 $
--   Date:    $Date: 2006-06-16 09:59:26-04 $
-- --------------------------------------------------------------------

use STD.TEXTIO.all;

package std_logic_1164 is

  -------------------------------------------------------------------    
  -- logic state system  (unresolved)
  -------------------------------------------------------------------    
  type STD_ULOGIC is ( 'U',             -- Uninitialized
                       'X',             -- Forcing  Unknown
                       '0',             -- Forcing  0
                       '1',             -- Forcing  1
                       'Z',             -- High Impedance   
                       'W',             -- Weak     Unknown
                       'L',             -- Weak     0       
                       'H',             -- Weak     1       
                       '-'              -- Don't care
                       );
  -------------------------------------------------------------------    
-- begin LCS-2006-141
  -- unconstrained array of std_ulogic for use with the resolution function
  -- and for use in declaring signal arrays of unresolved elements
-- end LCS-2006-141
  -------------------------------------------------------------------    
  type STD_ULOGIC_VECTOR is array (NATURAL range <>) of STD_ULOGIC;

  -------------------------------------------------------------------    
  -- resolution function
  -------------------------------------------------------------------    
  function resolved (s : STD_ULOGIC_VECTOR) return STD_ULOGIC;


  -------------------------------------------------------------------    
-- begin LCS-2006-141
  -- logic state system  (resolved)
-- end LCS-2006-141
  -------------------------------------------------------------------    
  subtype STD_LOGIC is resolved STD_ULOGIC;

  -------------------------------------------------------------------    
-- begin LCS-2006-141
  -- unconstrained array of resolved std_ulogic for use in declaring
  -- signal arrays of resolved elements
  -------------------------------------------------------------------    
  subtype STD_LOGIC_VECTOR is (resolved) STD_ULOGIC_VECTOR;
-- end LCS-2006-141

  -------------------------------------------------------------------    
  -- common subtypes
  -------------------------------------------------------------------    
  subtype X01 is resolved STD_ULOGIC range 'X' to '1';    -- ('X','0','1') 
  subtype X01Z is resolved STD_ULOGIC range 'X' to 'Z';   -- ('X','0','1','Z') 
  subtype UX01 is resolved STD_ULOGIC range 'U' to '1';   -- ('U','X','0','1') 
  subtype UX01Z is resolved STD_ULOGIC range 'U' to 'Z';  -- ('U','X','0','1','Z') 

  -------------------------------------------------------------------    
  -- overloaded logical operators
  -------------------------------------------------------------------    

  function "and"  (l : STD_ULOGIC; r : STD_ULOGIC) return UX01;
  function "nand" (l : STD_ULOGIC; r : STD_ULOGIC) return UX01;
  function "or"   (l : STD_ULOGIC; r : STD_ULOGIC) return UX01;
  function "nor"  (l : STD_ULOGIC; r : STD_ULOGIC) return UX01;
  function "xor"  (l : STD_ULOGIC; r : STD_ULOGIC) return UX01;
  function "xnor" (l : STD_ULOGIC; r : STD_ULOGIC) return ux01;
  function "not"  (l : STD_ULOGIC) return UX01;

  -------------------------------------------------------------------    
  -- vectorized overloaded logical operators
  -------------------------------------------------------------------    
-- begin LCS-2006-141
--    FUNCTION "and"  ( l, r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "and" (l, r  : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "nand" ( l, r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "nand" (l, r : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "or"   ( l, r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "or" (l, r   : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "nor"  ( l, r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "nor" (l, r  : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "xor"  ( l, r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "xor" (l, r  : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "xnor" ( l, r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "xnor" (l, r : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "not"  ( l : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "not" (l     : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;

-- begin LCS-2006-103
-- begin LCS-2006-141
--    FUNCTION "and"  ( l : std_logic_vector;  r : std_ulogic ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "and" (l : STD_ULOGIC_VECTOR; r : STD_ULOGIC) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--    FUNCTION "and"  ( l : std_ulogic; r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "and" (l : STD_ULOGIC; r : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;

-- begin LCS-2006-141
--    FUNCTION "nand" ( l : std_logic_vector;  r : std_ulogic ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "nand" (l : STD_ULOGIC_VECTOR; r : STD_ULOGIC) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--    FUNCTION "nand" ( l : std_ulogic; r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "nand" (l : STD_ULOGIC; r : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;

-- begin LCS-2006-141
--    FUNCTION "or"   ( l : std_logic_vector;  r : std_ulogic ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "or" (l : STD_ULOGIC_VECTOR; r : STD_ULOGIC) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--    FUNCTION "or"   ( l : std_ulogic; r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "or" (l : STD_ULOGIC; r : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;

-- begin LCS-2006-141
--    FUNCTION "nor"  ( l : std_logic_vector;  r : std_ulogic ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "nor" (l : STD_ULOGIC_VECTOR; r : STD_ULOGIC) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--    FUNCTION "nor"  ( l : std_ulogic; r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "nor" (l : STD_ULOGIC; r : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;

-- begin LCS-2006-141
--    FUNCTION "xor"  ( l : std_logic_vector;  r : std_ulogic ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "xor" (l : STD_ULOGIC_VECTOR; r : STD_ULOGIC) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--    FUNCTION "xor"  ( l : std_ulogic; r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "xor" (l : STD_ULOGIC; r : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;

-- begin LCS-2006-141
--    FUNCTION "xnor" ( l : std_logic_vector;  r : std_ulogic ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "xnor" (l : STD_ULOGIC_VECTOR; r : STD_ULOGIC) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--    FUNCTION "xnor" ( l : std_ulogic; r : std_logic_vector  ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "xnor" (l : STD_ULOGIC; r : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;

-- begin LCS-2006-141
--    FUNCTION "and"  ( l  : std_logic_vector  ) RETURN std_ulogic;
-- end LCS-2006-141
  function "and" (l  : STD_ULOGIC_VECTOR) return STD_ULOGIC;
-- begin LCS-2006-141
--
--    FUNCTION "nand" ( l  : std_logic_vector  ) RETURN std_ulogic;
-- end LCS-2006-141
  function "nand" (l : STD_ULOGIC_VECTOR) return STD_ULOGIC;
-- begin LCS-2006-141
--
--    FUNCTION "or"   ( l  : std_logic_vector  ) RETURN std_ulogic;
-- end LCS-2006-141
  function "or" (l   : STD_ULOGIC_VECTOR) return STD_ULOGIC;
-- begin LCS-2006-141
--
--    FUNCTION "nor"  ( l  : std_logic_vector  ) RETURN std_ulogic;
-- end LCS-2006-141
  function "nor" (l  : STD_ULOGIC_VECTOR) return STD_ULOGIC;
-- begin LCS-2006-141
--
--    FUNCTION "xor"  ( l  : std_logic_vector  ) RETURN std_ulogic;
-- end LCS-2006-141
  function "xor" (l  : STD_ULOGIC_VECTOR) return STD_ULOGIC;
-- begin LCS-2006-141
--
--    FUNCTION "xnor" ( l  : std_logic_vector  ) RETURN std_ulogic;
-- end LCS-2006-141
  function "xnor" (l : STD_ULOGIC_VECTOR) return STD_ULOGIC;

-- end LCS-2006-103
-- begin LCS-2006-120
  -------------------------------------------------------------------
  -- shift operators
  -------------------------------------------------------------------

-- begin LCS-2006-141
--    FUNCTION "sll" ( l  : std_logic_vector;  r : INTEGER ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "sll" (l : STD_ULOGIC_VECTOR; r : INTEGER) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "srl" ( l  : std_logic_vector;  r : INTEGER ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "srl" (l : STD_ULOGIC_VECTOR; r : INTEGER) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "rol" ( l  : std_logic_vector;  r : INTEGER ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "rol" (l : STD_ULOGIC_VECTOR; r : INTEGER) return STD_ULOGIC_VECTOR;
-- begin LCS-2006-141
--
--    FUNCTION "ror" ( l  : std_logic_vector;  r : INTEGER ) RETURN std_logic_vector;
-- end LCS-2006-141
  function "ror" (l : STD_ULOGIC_VECTOR; r : INTEGER) return STD_ULOGIC_VECTOR;

-- end LCS-2006-120
  -------------------------------------------------------------------
  -- conversion functions
  -------------------------------------------------------------------
  function To_bit (s       : STD_ULOGIC; xmap : BIT        := '0') return BIT;
-- begin LCS-2006-141
--    FUNCTION To_bitvector ( s : std_logic_vector ; xmap : BIT := '0') RETURN BIT_VECTOR;
-- end LCS-2006-141
  function To_bitvector (s : STD_ULOGIC_VECTOR; xmap : BIT := '0') return BIT_VECTOR;

  function To_StdULogic       (b : BIT) return STD_ULOGIC;
  function To_StdLogicVector  (b : BIT_VECTOR) return STD_LOGIC_VECTOR;
  function To_StdLogicVector  (s : STD_ULOGIC_VECTOR) return STD_LOGIC_VECTOR;
  function To_StdULogicVector (b : BIT_VECTOR) return STD_ULOGIC_VECTOR;
  function To_StdULogicVector (s : STD_LOGIC_VECTOR) return STD_ULOGIC_VECTOR;

-- begin LCS-2006-130
  alias To_Bit_Vector is
    To_bitvector[STD_ULOGIC_VECTOR, BIT return BIT_VECTOR];
  alias To_BV is
    To_bitvector[STD_ULOGIC_VECTOR, BIT return BIT_VECTOR];
  
  alias To_Std_Logic_Vector is
    To_StdLogicVector[BIT_VECTOR return STD_LOGIC_VECTOR];
  alias To_SLV is
    To_StdLogicVector[BIT_VECTOR return STD_LOGIC_VECTOR];

  alias To_Std_Logic_Vector is
    To_StdLogicVector[STD_ULOGIC_VECTOR return STD_LOGIC_VECTOR];
  alias To_SLV is
    To_StdLogicVector[STD_ULOGIC_VECTOR return STD_LOGIC_VECTOR];

  alias To_Std_ULogic_Vector is
    To_StdULogicVector[BIT_VECTOR return STD_ULOGIC_VECTOR];
  alias To_SUV is
    To_StdULogicVector[BIT_VECTOR return STD_ULOGIC_VECTOR];

  alias To_Std_ULogic_Vector is
    To_StdULogicVector[STD_LOGIC_VECTOR return STD_ULOGIC_VECTOR];
  alias To_SUV is
    To_StdULogicVector[STD_LOGIC_VECTOR return STD_ULOGIC_VECTOR];

-- end LCS-2006-130
  -------------------------------------------------------------------    
  -- strength strippers and type convertors
  -------------------------------------------------------------------    

-- begin LCS-2006-141
--    FUNCTION To_X01  ( s : std_logic_vector  ) RETURN  std_logic_vector;
-- end LCS-2006-141
  function To_X01 (s : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
  function To_X01 (s : STD_ULOGIC) return X01;
-- begin LCS-2006-141
--    FUNCTION To_X01  ( b : BIT_VECTOR        ) RETURN  std_logic_vector;
-- end LCS-2006-141
  function To_X01 (b : BIT_VECTOR) return STD_ULOGIC_VECTOR;
  function To_X01 (b : BIT) return X01;

-- begin LCS-2006-141
--    FUNCTION To_X01Z ( s : std_logic_vector  ) RETURN  std_logic_vector;
-- end LCS-2006-141
  function To_X01Z (s : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
  function To_X01Z (s : STD_ULOGIC) return X01Z;
-- begin LCS-2006-141
--    FUNCTION To_X01Z ( b : BIT_VECTOR        ) RETURN  std_logic_vector;
-- end LCS-2006-141
  function To_X01Z (b : BIT_VECTOR) return STD_ULOGIC_VECTOR;
  function To_X01Z (b : BIT) return X01Z;

-- begin LCS-2006-141
--    FUNCTION To_UX01  ( s : std_logic_vector  ) RETURN  std_logic_vector;
-- end LCS-2006-141
  function To_UX01 (s : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
  function To_UX01 (s : STD_ULOGIC) return UX01;
-- begin LCS-2006-141
--    FUNCTION To_UX01  ( b : BIT_VECTOR        ) RETURN  std_logic_vector;
-- end LCS-2006-141
  function To_UX01 (b : BIT_VECTOR) return STD_ULOGIC_VECTOR;
  function To_UX01 (b : BIT) return UX01;

-- begin LCS-2006-121
  function "??" (l : STD_ULOGIC) return BOOLEAN;

-- end LCS-2006-121
  -------------------------------------------------------------------    
  -- edge detection
  -------------------------------------------------------------------    
  function rising_edge  (signal s : STD_ULOGIC) return BOOLEAN;
  function falling_edge (signal s : STD_ULOGIC) return BOOLEAN;

  -------------------------------------------------------------------    
  -- object contains an unknown
  -------------------------------------------------------------------    
  function Is_X (s : STD_ULOGIC_VECTOR) return BOOLEAN;
-- begin LCS-2006-141
--    FUNCTION Is_X ( s : std_logic_vector  ) RETURN  BOOLEAN;
-- end LCS-2006-141
  function Is_X (s : STD_ULOGIC) return BOOLEAN;

-- begin LCS-2006-107, LCS-2006-121
  -------------------------------------------------------------------
  -- matching relational operators
  -------------------------------------------------------------------
  -- the following operations are predefined

  --  function "?=" (l, r : STD_ULOGIC) return STD_ULOGIC;
-- begin LCS-2006-141
--  -- function "?=" (l, r : STD_LOGIC_VECTOR) return STD_ULOGIC;
-- end LCS-2006-141
  --  function "?=" (l, r : STD_ULOGIC_VECTOR) return STD_ULOGIC;

  --  function "?/=" (l, r : STD_ULOGIC) return STD_ULOGIC;
-- begin LCS-2006-141
--  -- function "?/=" (l, r : STD_LOGIC_VECTOR) return STD_ULOGIC;
-- end LCS-2006-141
--  function "?/=" (l, r : STD_ULOGIC_VECTOR) return STD_ULOGIC;

  --  function "?<" (l, r  : STD_ULOGIC) return STD_ULOGIC;
  --  function "?<=" (l, r : STD_ULOGIC) return STD_ULOGIC;
  --  function "?>" (l, r  : STD_ULOGIC) return STD_ULOGIC;
  --  function "?>=" (l, r : STD_ULOGIC) return STD_ULOGIC;
  
-- end LCS-2006-107, LCS-2006-121
-- begin LCS-2006-131
  -------------------------------------------------------------------
  -- string conversion and write operations
  -------------------------------------------------------------------
  -- the following operations are predefined

  -- function to_string (value : STD_ULOGIC) return STRING;
  -- function to_string (value : STD_ULOGIC_VECTOR) return STRING;

  -- explicitly defined operations

  alias TO_BSTRING is TO_STRING [STD_ULOGIC_VECTOR return STRING];
  alias TO_BINARY_STRING is TO_STRING [STD_ULOGIC_VECTOR return STRING];
  function TO_OSTRING (VALUE : STD_ULOGIC_VECTOR) return STRING;
  alias TO_OCTAL_STRING is TO_OSTRING [STD_ULOGIC_VECTOR return STRING];
  function TO_HSTRING (VALUE : STD_ULOGIC_VECTOR) return STRING;
  alias TO_HEX_STRING is TO_HSTRING [STD_ULOGIC_VECTOR return STRING];

  procedure READ (L : inout LINE; VALUE : out STD_ULOGIC; GOOD : out BOOLEAN);
  procedure READ (L : inout LINE; VALUE : out STD_ULOGIC);

  procedure READ (L : inout LINE; VALUE : out STD_ULOGIC_VECTOR; GOOD : out BOOLEAN);
  procedure READ (L : inout LINE; VALUE : out STD_ULOGIC_VECTOR);

  procedure WRITE (L         : inout LINE; VALUE : in STD_ULOGIC;
                   JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);

  procedure WRITE (L         : inout LINE; VALUE : in STD_ULOGIC_VECTOR;
                   JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);

  alias BREAD is READ [LINE, STD_ULOGIC_VECTOR, BOOLEAN];
  alias BREAD is READ [LINE, STD_ULOGIC_VECTOR];
  alias BINARY_READ is READ [LINE, STD_ULOGIC_VECTOR, BOOLEAN];
  alias BINARY_READ is READ [LINE, STD_ULOGIC_VECTOR];

  procedure OREAD (L : inout LINE; VALUE : out STD_ULOGIC_VECTOR; GOOD : out BOOLEAN);
  procedure OREAD (L : inout LINE; VALUE : out STD_ULOGIC_VECTOR);
  alias OCTAL_READ is OREAD [LINE, STD_ULOGIC_VECTOR, BOOLEAN];
  alias OCTAL_READ is OREAD [LINE, STD_ULOGIC_VECTOR];

  procedure HREAD (L : inout LINE; VALUE : out STD_ULOGIC_VECTOR; GOOD : out BOOLEAN);
  procedure HREAD (L : inout LINE; VALUE : out STD_ULOGIC_VECTOR);
  alias HEX_READ is HREAD [LINE, STD_ULOGIC_VECTOR, BOOLEAN];
  alias HEX_READ is HREAD [LINE, STD_ULOGIC_VECTOR];

  alias BWRITE is WRITE [LINE, STD_ULOGIC_VECTOR, SIDE, WIDTH];
  alias BINARY_WRITE is WRITE [LINE, STD_ULOGIC_VECTOR, SIDE, WIDTH];
  
  procedure OWRITE (L         : inout LINE; VALUE : in STD_ULOGIC_VECTOR;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);
  alias OCTAL_WRITE is OWRITE [LINE, STD_ULOGIC_VECTOR, SIDE, WIDTH];
  
  procedure HWRITE (L         : inout LINE; VALUE : in STD_ULOGIC_VECTOR;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);
  alias HEX_WRITE is HWRITE [LINE, STD_ULOGIC_VECTOR, SIDE, WIDTH];

-- end LCS-2006-131
end package std_logic_1164;
