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
    if(b[i..i+p.length] == p)
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

int[Base[]] frequencyMap(Base[] b, int k)
{
  int[Base[]] map;
  foreach(i; 0..(b.length - k +1))
  {
    map[b[i..i+k].idup] += 1;
  }
  return map;
}

Base[][] frequencyWord(Base[] b, int k)
{
  auto s = DList!(Base[])();
  auto freq = frequencyMap(b, k);
  //TODO implement this
}



unittest
{
  auto b = fromString("GATATATGCATATACTT");
  assert(b.reverse.reverse == b);
}

unittest
{
  auto b = fromString("GATATATGCATATACTT");
  auto p = fromString("ATAT");
  assert([1,3,9] == patternIndex(b, p));
}

unittest
{
  auto b = fromString("GCGCG");
  auto p = fromString("GCG");
  assert(2 == patternCount(b,p));
}

unittest
{
  auto b = fromString("CGATATATCCATAG");
  auto map = frequencyMap(b, 3);
  int[Base[]] map2;
  map2[[Base.C, Base.G, Base.A].idup] = 1;
  map2[[Base.G, Base.A, Base.T].idup] = 1;
  map2[[Base.A, Base.T, Base.A].idup] = 3;
  map2[[Base.T, Base.A, Base.T].idup] = 2;
  map2[[Base.A, Base.T, Base.C].idup] = 1;
  map2[[Base.T, Base.C, Base.C].idup] = 1;
  map2[[Base.C, Base.C, Base.A].idup] = 1;
  map2[[Base.C, Base.A, Base.T].idup] = 1;
  map2[[Base.T, Base.A, Base.G].idup] = 1;

  assert(map == map2);
}
