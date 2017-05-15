import Language
       \/ cons0 (ParseFixture (jsonParseTree pathMode' "" []) jsonParseTreeOutput')
       \/ cons0 (ParseFixture (sExpressionParseTree commitMode repo []) "(Program\n  (Method\n    (Identifier)))\n")
       \/ cons0 (ParseFixture (jsonParseTree commitMode repo []) jsonParseTreeOutput'')
       \/ cons0 (ParseFixture (jsonParseTree (ParseCommit "2e4144eb8c44f007463ec34cb66353f0041161fe" []) repo []) emptyJsonParseTreeOutput)
       \/ cons0 (ParseFixture (jsonParseTree (ParsePaths []) repo []) emptyJsonParseTreeOutput)
       \/ cons0 (ParseFixture (jsonParseTree (ParseCommit "2e4144eb8c44f007463ec34cb66353f0041161fe" [("not-a-file.rb", Just Ruby)]) repo []) emptyJsonParseTreeOutput)
       \/ cons0 (ParseFixture (jsonParseTree (ParsePaths [("not-a-file.rb", Just Ruby)]) repo []) emptyJsonParseTreeOutput)
      pathMode = ParsePaths [("test/fixtures/ruby/and-or.A.rb", Just Ruby)]
      pathMode' = ParsePaths [("test/fixtures/ruby/and-or.A.rb", Just Ruby), ("test/fixtures/ruby/and-or.B.rb", Just Ruby)]
      commitMode = ParseCommit "2e4144eb8c44f007463ec34cb66353f0041161fe" [("methods.rb", Just Ruby)]
      sExpressionParseTreeOutput = "(Program\n  (Binary\n    (Identifier)\n    (Other \"and\")\n    (Identifier)))\n"
      jsonParseTreeOutput = "[{\"filePath\":\"test/fixtures/ruby/and-or.A.rb\",\"programNode\":{\"category\":\"Program\",\"children\":[{\"category\":\"Binary\",\"children\":[{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[0,3],\"sourceSpan\":{\"start\":[1,1],\"end\":[1,4]}},{\"category\":\"and\",\"children\":[],\"sourceRange\":[4,7],\"sourceSpan\":{\"start\":[1,5],\"end\":[1,8]}},{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[8,11],\"sourceSpan\":{\"start\":[1,9],\"end\":[1,12]}}],\"sourceRange\":[0,11],\"sourceSpan\":{\"start\":[1,1],\"end\":[1,12]}}],\"sourceRange\":[0,12],\"sourceSpan\":{\"start\":[1,1],\"end\":[2,1]}}}]\n"
      jsonParseTreeOutput' = "[{\"filePath\":\"test/fixtures/ruby/and-or.A.rb\",\"programNode\":{\"category\":\"Program\",\"children\":[{\"category\":\"Binary\",\"children\":[{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[0,3],\"sourceSpan\":{\"start\":[1,1],\"end\":[1,4]}},{\"category\":\"and\",\"children\":[],\"sourceRange\":[4,7],\"sourceSpan\":{\"start\":[1,5],\"end\":[1,8]}},{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[8,11],\"sourceSpan\":{\"start\":[1,9],\"end\":[1,12]}}],\"sourceRange\":[0,11],\"sourceSpan\":{\"start\":[1,1],\"end\":[1,12]}}],\"sourceRange\":[0,12],\"sourceSpan\":{\"start\":[1,1],\"end\":[2,1]}}},{\"filePath\":\"test/fixtures/ruby/and-or.B.rb\",\"programNode\":{\"category\":\"Program\",\"children\":[{\"category\":\"Binary\",\"children\":[{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[0,3],\"sourceSpan\":{\"start\":[1,1],\"end\":[1,4]}},{\"category\":\"or\",\"children\":[],\"sourceRange\":[4,6],\"sourceSpan\":{\"start\":[1,5],\"end\":[1,7]}},{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[7,10],\"sourceSpan\":{\"start\":[1,8],\"end\":[1,11]}}],\"sourceRange\":[0,10],\"sourceSpan\":{\"start\":[1,1],\"end\":[1,11]}},{\"category\":\"Binary\",\"children\":[{\"category\":\"Binary\",\"children\":[{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[11,12],\"sourceSpan\":{\"start\":[2,1],\"end\":[2,2]}},{\"category\":\"or\",\"children\":[],\"sourceRange\":[13,15],\"sourceSpan\":{\"start\":[2,3],\"end\":[2,5]}},{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[16,17],\"sourceSpan\":{\"start\":[2,6],\"end\":[2,7]}}],\"sourceRange\":[11,17],\"sourceSpan\":{\"start\":[2,1],\"end\":[2,7]}},{\"category\":\"and\",\"children\":[],\"sourceRange\":[18,21],\"sourceSpan\":{\"start\":[2,8],\"end\":[2,11]}},{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[22,23],\"sourceSpan\":{\"start\":[2,12],\"end\":[2,13]}}],\"sourceRange\":[11,23],\"sourceSpan\":{\"start\":[2,1],\"end\":[2,13]}}],\"sourceRange\":[0,24],\"sourceSpan\":{\"start\":[1,1],\"end\":[3,1]}}}]\n"
      jsonParseTreeOutput'' = "[{\"filePath\":\"methods.rb\",\"programNode\":{\"category\":\"Program\",\"children\":[{\"category\":\"Method\",\"children\":[{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[4,7],\"sourceSpan\":{\"start\":[1,5],\"end\":[1,8]}}],\"identifier\":\"foo\",\"sourceRange\":[0,11],\"sourceSpan\":{\"start\":[1,1],\"end\":[2,4]}}],\"sourceRange\":[0,12],\"sourceSpan\":{\"start\":[1,1],\"end\":[3,1]}}}]\n"
      emptyJsonParseTreeOutput = "[]\n"
      pathMode = DiffPaths ("test/fixtures/ruby/method-declaration.A.rb", Just Ruby) ("test/fixtures/ruby/method-declaration.B.rb", Just Ruby)
      commitMode = DiffCommits "dfac8fd681b0749af137aebf3203e77a06fbafc2" "2e4144eb8c44f007463ec34cb66353f0041161fe" [("methods.rb", Just Ruby)]

      jsonOutput = "{\"oids\":[\"0000000000000000000000000000000000000000\",\"0000000000000000000000000000000000000000\"],\"paths\":[\"test/fixtures/ruby/method-declaration.A.rb\",\"test/fixtures/ruby/method-declaration.B.rb\"],\"rows\":[[{\"category\":\"Program\",\"children\":[{\"category\":\"Method\",\"children\":[{\"replace\":{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[4,7],\"sourceSpan\":{\"start\":[1,5],\"end\":[1,8]}}}],\"sourceRange\":[0,8],\"sourceSpan\":{\"start\":[1,1],\"end\":[2,4]}}],\"sourceRange\":[0,8],\"number\":1,\"sourceSpan\":{\"start\":[1,1],\"end\":[3,1]}},{\"category\":\"Program\",\"children\":[{\"category\":\"Method\",\"children\":[{\"replace\":{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[4,7],\"sourceSpan\":{\"start\":[1,5],\"end\":[1,8]}}},{\"insert\":{\"category\":\"Params\",\"children\":[{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[8,9],\"sourceSpan\":{\"start\":[1,9],\"end\":[1,10]}}],\"sourceRange\":[7,11],\"sourceSpan\":{\"start\":[1,8],\"end\":[2,3]}}}],\"sourceRange\":[0,11],\"sourceSpan\":{\"start\":[1,1],\"end\":[3,4]}}],\"sourceRange\":[0,11],\"number\":1,\"sourceSpan\":{\"start\":[1,1],\"end\":[4,1]}}],[{\"category\":\"Program\",\"children\":[{\"category\":\"Method\",\"children\":[{\"insert\":{\"category\":\"Params\",\"children\":[],\"sourceRange\":[11,13],\"sourceSpan\":{\"start\":[1,8],\"end\":[2,3]}}},{\"insert\":{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[13,16],\"sourceSpan\":{\"start\":[2,3],\"end\":[2,6]}}}],\"sourceRange\":[11,17],\"sourceSpan\":{\"start\":[1,1],\"end\":[3,4]}}],\"sourceRange\":[11,17],\"number\":2,\"sourceSpan\":{\"start\":[1,1],\"end\":[4,1]}}],[{\"category\":\"Program\",\"children\":[{\"category\":\"Method\",\"children\":[],\"sourceRange\":[8,11],\"sourceSpan\":{\"start\":[1,1],\"end\":[2,4]}}],\"sourceRange\":[8,12],\"number\":2,\"sourceSpan\":{\"start\":[1,1],\"end\":[3,1]}},{\"category\":\"Program\",\"children\":[{\"category\":\"Method\",\"children\":[],\"sourceRange\":[17,20],\"sourceSpan\":{\"start\":[1,1],\"end\":[3,4]}}],\"sourceRange\":[17,21],\"number\":3,\"sourceSpan\":{\"start\":[1,1],\"end\":[4,1]}}],[{\"category\":\"Program\",\"children\":[],\"sourceRange\":[12,12],\"number\":3,\"sourceSpan\":{\"start\":[1,1],\"end\":[3,1]}},{\"category\":\"Program\",\"children\":[],\"sourceRange\":[21,21],\"number\":4,\"sourceSpan\":{\"start\":[1,1],\"end\":[4,1]}}]]}\n"
      jsonOutput' = "{\"oids\":[\"0000000000000000000000000000000000000000\",\"ff7bbbe9495f61d9e1e58c597502d152bab1761e\"],\"paths\":[\"methods.rb\",\"methods.rb\"],\"rows\":[[{\"insert\":{\"category\":\"Program\",\"children\":[{\"category\":\"Method\",\"children\":[{\"category\":\"Identifier\",\"children\":[],\"sourceRange\":[4,7],\"sourceSpan\":{\"start\":[1,5],\"end\":[1,8]}}],\"sourceRange\":[0,8],\"sourceSpan\":{\"start\":[1,1],\"end\":[2,4]}}],\"sourceRange\":[0,8],\"sourceSpan\":{\"start\":[1,1],\"end\":[3,1]}},\"number\":1}],[{\"insert\":{\"category\":\"Program\",\"children\":[{\"category\":\"Method\",\"children\":[],\"sourceRange\":[8,11],\"sourceSpan\":{\"start\":[1,1],\"end\":[2,4]}}],\"sourceRange\":[8,12],\"sourceSpan\":{\"start\":[1,1],\"end\":[3,1]}},\"number\":2}],[{\"insert\":{\"category\":\"Program\",\"children\":[],\"sourceRange\":[12,12],\"sourceSpan\":{\"start\":[1,1],\"end\":[3,1]}},\"number\":3}]]}\n"
      sExpressionOutput = "(Program\n  (Method\n  { (Identifier)\n  ->(Identifier) }\n  {+(Params\n      (Identifier))+}\n  {+(Identifier)+}))\n"
      sExpressionOutput' = "{+(Program\n  (Method\n    (Identifier)))+}\n"