module base;

import algo = std.algorithm;

import std.array;
import std.algorithm : map, joiner;
import std.uni : toUpper;
import std.conv : to;
import std.stdio;

enum Base : byte{A, C, T, G, U}

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

struct Strand
{
  Base[] strand;
  this(Base[] bases)
  {
    strand = bases;
  }
  this(string bases)
  {
    strand = fromString(bases);
  }
  this(File file)
  {
    string line;
    while ((line = file.readln()) !is null)
      {
        strand ~= fromString(line);
      }
  }

  static Base[] fromString(string bases)
  {
    return bases.map!(fromChar).array();
  }

  string toString()
  {
    return to!string(strand.map!(toChar));
  }

  Strand reverse()
  {
    auto r = this;
    algo.reverse(r.strand);
    return r;
  }

  Strand complement()
  {
    return Strand(strand.map!(complement).array);
  }

  Strand reverseComplement()
  {
    auto r = complement();
    r.strand = algo.reverse(r.strand);
    return r;
  }

  @property auto length() { return strand.length; }

  ref Base opIndex(int i) { return strand[i]; }
  Base[] opIndex() { return strand[]; }

  @property ulong opDollar() { return strand.length; }

unittest
{
  string g = "ACTGCTGAGCU";
  //TODO test
}
