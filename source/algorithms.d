module algorithm;

import base;

import std.stdio;
import algo = std.algorithm;
import std.array : array;
import std.algorithm : map;
import std.container : DList;


ulong[] patternIndex(Strand b, Strand p)
{
  auto s = DList!ulong();
  foreach(i; 0..(b.length - p.length +1))
  {
    if(b(i, i+p.length) == p)
    {
      s.insertBack(i);
    }
  }
  return s.array;
}

ulong patternCount(Strand b, Strand p)
{
  return patternIndex(b,p).length;
}

int[Strand] frequencyMap(Strand b, int k)
{
  int[Strand] map;
  foreach(i; 0..(b.length - k +1))
  {
    map[b(i, i+k)] += 1;
  }
  return map;
}

Strand[] frequencyWord(Strand b, int k)
{
  auto s = DList!(Strand)();
  auto freq = frequencyMap(b, k);
  //TODO implement this
  return s.array;
}



unittest
{
  auto b = Strand("GATATATGCATATACTT");
  assert(b.reverse.reverse == b);
}

unittest
{
  auto b = Strand("GATATATGCATATACTT");
  auto p = Strand("ATAT");
  assert([1,3,9] == patternIndex(b, p));
}

unittest
{
  auto b = Strand("GCGCG");
  auto p = Strand("GCG");
  assert(2 == patternCount(b,p));
}

unittest
{
  auto b = Strand("CGATATATCCATAG");
  auto map = frequencyMap(b, 3);
  int[Strand] map2;
  map2[Strand([Base.C, Base.G, Base.A])] = 1;
  map2[Strand([Base.G, Base.A, Base.T])] = 1;
  map2[Strand([Base.A, Base.T, Base.A])] = 3;
  map2[Strand([Base.T, Base.A, Base.T])] = 2;
  map2[Strand([Base.A, Base.T, Base.C])] = 1;
  map2[Strand([Base.T, Base.C, Base.C])] = 1;
  map2[Strand([Base.C, Base.C, Base.A])] = 1;
  map2[Strand([Base.C, Base.A, Base.T])] = 1;
  map2[Strand([Base.T, Base.A, Base.G])] = 1;

  assert(map == map2);
}
// freq World k = 3 assert = 4 TAAACGTGAGAGAAACGTGCTGATTACACTTGTTCGTGTGGTAT
