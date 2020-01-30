# DecomposeStrName
Decomposition of structure field string

This program is a function to decompose structure field names with various field names and different depths.
It can be expanded even if there are tens of thousands of fields.
Structure field names are decompose as follows: 

AAA.BBB = 1;
AAA.CCC.aaa = 2;
AAA.DDD.bbb.aaa = 3;
AAA.EEE = 4;
AAA.FFF.aaa.bbb.ccc = 5;
AAA.TTT.BBB = 10

'AAA.BBB'
'AAA.CCC.aaa'
'AAA.DDD.bbb.aaa'
'AAA.EEE'
'AAA.FFF.aaa.bbb.ccc'
'AAA.TTT.BBB'
