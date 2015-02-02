function [ fuzzy ] = fuzzification( data, rules )

  % Define linguistics
  plarge  = 1;      %PB
  pmedium = 2;      %PM
  psmall  = 3;      %PS
  zero    = 4;      %ZZ
  nsmall  = 5;      %NS
  nmedium = 6;      %NM
  nlarge  = 7;      %NB

  if data >= rules( plarge )

    fuzzy = plarge;

  elseif data >= rules( pmedium ) 

    fuzzy = pmedium;

  elseif data > rules( zero )

    fuzzy = psmall;

  elseif data == rules( zero )

    fuzzy = zero;

  elseif data <= rules( nlarge )

    fuzzy = nlarge;

  elseif data <= rules( nmedium )

    fuzzy = nmedium;

  elseif data <= rules( nsmall )

    fuzzy = nsmall;

  elseif data < rules( zero )

    fuzzy = nsmall;

  end;