import std.stdio;

import base;
import algorithm;

void main()
{
  auto b = Strand("TAAACGTGAGAGAAACGTGCTGATTACACTTGTTCGTGTGGTAT");
  //writeln(patternCount(b, Strand("AAA")));
  auto a = Strand("TTGTGTC");
  writeln(frequencyMap(b, 3));
  writeln(a.reverseComplement());
}
