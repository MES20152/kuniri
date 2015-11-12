require_relative '../../spec_helper'

RSpec.describe Languages::CplusplusSyntax do

  before :each do
    @syntax = Languages::CplusplusSyntax.new
  end

  context "Extern requirement detections." do

    it "Correct state transition (include)." do
      path = "spec/samples/cplusplusSyntaxParts/extern/include.cpp"

      expect(@syntax.state)
          .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)

      @syntax.analyse_source(path)

      expect(@syntax.state)
          .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (include)." do
      path = "spec/samples/cplusplusSyntaxParts/extern/include.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].extern_requirements[0].name).to eq ("one")
      expect(@syntax.fileElements[0].extern_requirements[1].name).to eq ("two")
      expect(@syntax.fileElements[0].extern_requirements[2].name)
        .to eq ("three")
      expect(@syntax.fileElements[0].extern_requirements[3].name)
        .to eq ("four")
      expect(@syntax.fileElements[0].extern_requirements[4].name)
        .to eq ("five")
      expect(@syntax.fileElements[0].extern_requirements.size).to eq (5)
    end

  end

  context "Global variable declarations." do
    it "Correct state transition" do
      path = "spec/samples/cplusplusSyntaxParts/variable/simpleVariable.cpp"
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (global variable)." do
      path = "spec/samples/cplusplusSyntaxParts/variable/simpleVariable.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].global_variables[0].name).to eq("int one")
      expect(@syntax.fileElements[0].global_variables[1].name).to eq("Example two")
      expect(@syntax.fileElements[0].global_variables[2].name).to eq("int three")
      expect(@syntax.fileElements[0].global_variables[3].name).to eq("int four")
      expect(@syntax.fileElements[0].global_variables[4].name).to eq("double five")
      expect(@syntax.fileElements[0].global_variables[5].name).to eq("float six")
      expect(@syntax.fileElements[0].global_variables[6].name).to eq("string seven")
      expect(@syntax.fileElements[0].global_variables[7].name).to eq("char eight")
      expect(@syntax.fileElements[0].global_variables[8].name).to eq("int nine")
      expect(@syntax.fileElements[0].global_variables[9].name).to eq("string ten")
      expect(@syntax.fileElements[0].global_variables[10].name).to eq("int eleven")
      expect(@syntax.fileElements[0].global_variables[11].name).to eq("int tweve")
      expect(@syntax.fileElements[0].global_variables[12].name).to eq("int thirteen")
      expect(@syntax.fileElements[0].global_variables[13].name).to eq("int fourteen")
    end
  end

  context "Global function" do
    it "Correct state transition function." do
      path = "spec/samples/cplusplusSyntaxParts/function/simpleFunction.cpp"
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (global function)" do
      path = "spec/samples/cplusplusSyntaxParts/function/simpleFunction.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].global_functions[0].name)
        .to eq("simpleFunction1")
      expect(@syntax.fileElements[0].global_functions[1].name)
        .to eq("SimpleFunction2")
      expect(@syntax.fileElements[0].global_functions[2].name)
        .to eq("SimpleFunction3")
      expect(@syntax.fileElements[0].global_functions[3].name)
        .to eq("simpleFunction4")
      expect(@syntax.fileElements[0].global_functions[4].name)
        .to eq("SimpleFunction5")
      expect(@syntax.fileElements[0].global_functions[5].name)
        .to eq("simpleFunction6")
      expect(@syntax.fileElements[0].global_functions[6].name)
        .to eq("simpleFunction7")
    end
  end

  context "Module declaration." do
    it "Correct state transition." do
      path = "spec/samples/cplusplusSyntaxParts/module/simpleModule.cpp"
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (module)" do
      path = "spec/samples/cplusplusSyntaxParts/module/simpleModule.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].modules[0].name)
        .to eq("Xpto")
      expect(@syntax.fileElements[0].modules[1].name)
        .to eq("Abc")
      expect(@syntax.fileElements[0].modules[2].name)
        .to eq("Simple")
    end
  end

  context "Class declaration" do
    it "Correct state transition." do
      path = "spec/samples/cplusplusSyntaxParts/class/simpleClass.cpp"

      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (class)." do
      path = "spec/samples/cplusplusSyntaxParts/class/simpleClass.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].name).to eq("Simple1")
      expect(@syntax.fileElements[0].classes[1].name).to eq("Simple2")
      expect(@syntax.fileElements[0].classes[2].name).to eq("Simple3")
      expect(@syntax.fileElements[0].classes[3].name).to eq("Simple4")
      expect(@syntax.fileElements[0].classes[4].name).to eq("Simple5")
    end

  end

  context "Attribute line" do
    it "Correct state transition." do
      path = "spec/samples/cplusplusSyntaxParts/attribute/simpleAttribute.cpp"

      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (attribute)" do
      path = "spec/samples/cplusplusSyntaxParts/attribute/simpleAttribute.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].attributes[0].name)
        .to eq("int attribute1")
      expect(@syntax.fileElements[0].classes[0].attributes[1].name)
        .to eq("double attribute2")
      expect(@syntax.fileElements[0].classes[0].attributes[2].name)
        .to eq("string attribute3")
      expect(@syntax.fileElements[0].classes[0].attributes[3].name)
        .to eq("float attribute4")
      expect(@syntax.fileElements[0].classes[0].attributes[4].name)
        .to eq("char attribute5")
      expect(@syntax.fileElements[0].classes[0].attributes[5].name)
        .to eq("int attribute6")

    end
  end

  context "Method line" do
    it "Correct state transition." do
      path = "spec/samples/cplusplusSyntaxParts/method/simpleMethod.cpp"

      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (method)" do
      path = "spec/samples/cplusplusSyntaxParts/method/simpleMethod.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].methods[0].name)
        .to eq("method1")
      expect(@syntax.fileElements[0].classes[0].methods[1].name)
        .to eq("method2")
      expect(@syntax.fileElements[0].classes[0].methods[2].name)
        .to eq("method3")
    end
  end

  context "Constructor line" do
    it "Correct state transition." do
      path = "spec/samples/cplusplusSyntaxParts/constructor/simpleConstructor.cpp"

      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (constructor)" do
      path = "spec/samples/cplusplusSyntaxParts/constructor/simpleConstructor.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].constructors[0].name)
        .to eq("Simple1")
      expect(@syntax.fileElements[0].classes[1].constructors[0].name)
        .to eq("Simple2")
    end
  end

  context "Conditional line" do
    it "Correct state transition (Method)." do
      path =
        "spec/samples/cplusplusSyntaxParts/conditionalStatement/methodConditional.cpp"

      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (conditional - method)" do
       path =
        "spec/samples/cplusplusSyntaxParts/conditionalStatement/methodConditional.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].methods[0].name)
        .to eq("simple1")

      expect(@syntax.fileElements[0].classes[0].methods[0]
            .conditionals[0].expression).to eq("3 > 2")
      expect(@syntax.fileElements[0].classes[0].methods[0]
            .conditionals[0].type).to eq("IF")
      expect(@syntax.fileElements[0].classes[0].methods[0]
            .conditionals[1].expression).to eq("3 > 2")
      expect(@syntax.fileElements[0].classes[0].methods[0]
            .conditionals[1].type).to eq("SWITCH")

      expect(@syntax.fileElements[0].classes[0].methods[1].name)
        .to eq("simple2")

      expect(@syntax.fileElements[0].classes[0].methods[1]
            .conditionals[0].expression).to eq("\"a\" < \"k\"")
      expect(@syntax.fileElements[0].classes[0].methods[1]
            .conditionals[0].type).to eq("IF")
    end

    it "Correct state transition (Constructor)." do
      path = "spec/samples/cplusplusSyntaxParts/" +
              "conditionalStatement/constructorConditional.cpp"

      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
        .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (conditional - method)" do
       path = "spec/samples/cplusplusSyntaxParts/" +
                "conditionalStatement/constructorConditional.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].constructors[0].name)
          .to eq("Simple1")

      expect(@syntax.fileElements[0].classes[0].constructors[0].conditionals[0]
              .expression).to eq("3 > 2")
      expect(@syntax.fileElements[0].classes[0].constructors[0].conditionals[0]
              .type).to eq("IF")

      expect(@syntax.fileElements[0].classes[0].constructors[0].conditionals[1]
              .expression).to eq("u && y")
      expect(@syntax.fileElements[0].classes[0].constructors[0].conditionals[1]
              .type).to eq("IF")

      expect(@syntax.fileElements[0].classes[0].constructors[0].conditionals[2]
              .expression).to eq("u == 1")
      expect(@syntax.fileElements[0].classes[0].constructors[0].conditionals[2]
              .type).to eq("ELSIF")
    end

    it "Correct data capture (repetition[while] -  Method)" do
       path = "spec/samples/cplusplusSyntaxParts/repetition/simpleRepetition.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].methods[0].name)
          .to eq("simple1")

      expect(@syntax.fileElements[0].classes[0].methods[0].repetitions[0]
              .expression).to eq("i < num")
      expect(@syntax.fileElements[0].classes[0].methods[0].repetitions[0]
              .expression).to eq("i < num")
    end

    it "Correct data capture (repetition[for] -  Method)" do
      path = "spec/samples/cplusplusSyntaxParts/repetition/simpleRepetition.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].methods[1].name)
          .to eq("simple2")

      expect(@syntax.fileElements[0].classes[0].methods[1].repetitions[0]
              .expression).to eq("int i = 0; i < 5; ++i")
    end

  end

  context "Comments" do

  #   it "Correct single line comment capture - Globals" do

  #     path = "spec/samples/cplusplusSyntaxParts/" +
  #             "comment/simple_single_line_comment_global.cpp"

  #     @syntax.analyse_source(path)
  #     expect(@syntax.fileElements[0].comments).to eq(" First comment\n")
  #     expect(@syntax.fileElements[0].global_functions[0].comments)
  #             .to eq(" Comment 2\n")
  #     expect(@syntax.fileElements[0].global_functions[1].comments)
  #             .to eq(" Combo comment p1\n Combo comment p2\n")
  #     expect(@syntax.fileElements[0].global_variables[0].comments)
  #             .to eq(" Comment 4\n")
  #   end

    it "Correct single line comment capture - Class" do

      path = "spec/samples/cplusplusSyntaxParts/" +
              "comment/simple_single_line_comment_class.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].comments)
              .to eq(" Comment 1: class\n")
      expect(@syntax.fileElements[0].classes[0].constructors[0].comments)
              .to eq(" Comment 2: constructor\n")
      expect(@syntax.fileElements[0].classes[0].methods[0].comments)
              .to eq(" Comment 3: method\n")
      expect(@syntax.fileElements[0].classes[0].methods[1].comments)
              .to eq(" Comment 4: Combo 1\n Comment 5: "+
                      "Combo 2\n Comment 6: Combo 3; Combo 4\n")
      expect(@syntax.fileElements[0].classes[0].attributes[0].comments)
              .to eq (" Comment 7: Attribute\n")
    end

  #   it "Correct multiple line comment capture - Global" do

  #     path = "spec/samples/cplusplusSyntaxParts/" +
  #             "comment/simple_multiple_line_comment_global.cpp"

  #     @syntax.analyse_source(path)
  #     expect(@syntax.fileElements[0].comments)
  #       .to eq("Comment 1:\nMultiple line.\n")
  #     expect(@syntax.fileElements[0].global_functions[0].comments)
  #             .to eq("Global Function\nnumber one\nmultiple line\n")
  #     expect(@syntax.fileElements[0].global_variables[0].comments)
  #             .to eq("global\n")
  #   end

    it "Correct multiple line comment capture - Class" do

      path = "spec/samples/cplusplusSyntaxParts/" +
              "comment/simple_multiple_line_comment_class.cpp"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].classes[0].comments)
              .to eq("This is the\nfirst class\nof this file.\n")
      expect(@syntax.fileElements[0].classes[0].constructors[0].comments)
              .to eq("    Constructor\n    initialize\n")
      expect(@syntax.fileElements[0].classes[0].methods[0].comments)
              .to eq("First method\n")
      expect(@syntax.fileElements[0].classes[0].methods[1].comments)
              .to eq("    methodTwo\n")
      expect(@syntax.fileElements[0].classes[0].methods[2].comments)
              .to eq("    method;Three\n")

    end

  end

  after :each do
    @syntax = nil
  end

end

