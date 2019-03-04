module algorithm;

import base;

import algo = std.algorithm;
import std.array : array;
import std.algorithm : map;

Base[] reverse(Base[] b)
{
  auto r = b;
  return algo.reverse(r);
}

Base[] complement(Base[] b)
{
  return b.map!(base.complement).array;
}

Base[] reverseComplement(Base[] b)
{
  return algo.reverse(complement(b));
}



unittest
{
  auto b = fromString("AGGTCCGTA");
  auto a = fromString("GGGTCCGTA");
  assert(b.reverse.reverse == b);
}
