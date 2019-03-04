module base;

import std.array;
import std.algorithm : map, joiner;
import std.uni : toUpper;
import std.conv : to;
import std.stdio;

enum Base : byte{A, C, T, G, U}

Base[] fromString(string bases)
{
  return bases.map!(fromChar).array();
}

Base complement(Base base)
{
  final switch(base)
    {
    case Base.A: return Base.T;
    case Base.T: return Base.A;
    case Base.C: return Base.G;
    case Base.G: return Base.C;
    case Base.U: return Base.U;
    }
}

Base fromChar(dchar base)
{
  base = base.toUpper;
  final switch(base){
  case 'A': return Base.A;
  case 'C': return Base.C;
  case 'T': return Base.T;
  case 'G': return Base.G;
  case 'U': return Base.U;
  }
}

dchar toChar(Base base)
{
  final switch(base){
  case Base.A: return 'A';
  case Base.C: return 'C';
  case Base.T: return 'T';
  case Base.G: return 'G';
  case Base.U: return 'U';
  }
}

string toString(Base[] bases)
{
  return to!string(bases.map!(toChar));
}

Base[] fromFile(File file)
{
  string line;
  Base[] strand;
  while ((line = file.readln()) !is null)
    {
      strand ~= fromString(line);
    }
  return strand;
}

unittest
{
  string g = "ACTGCTGAGCU";
  //TODO test
}
