require_relative '../../spec_helper'

RSpec.describe Languages::Python::ClassPython do

  before :all do 
    @classPython = Languages::Python::ClassPython.new
  end

  context "When is class without inheritance" do
    it "Ordinary class declaration." do
      classNameCaptured = @classPython.get_class("class Xpto:").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration with whitespace." do
      classNameCaptured = @classPython.get_class("     class      Xpto:").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration between whitespace." do
      classNameCaptured = @classPython.get_class("     class     Xpto   :").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration with whitespace in the beginning." do
      classNameCaptured = @classPython.get_class("        class Xpto:").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration with whitespace in the end." do
      classNameCaptured = @classPython.get_class("class Xpto        :").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration delimited by whitespace." do
      classNameCaptured = @classPython.get_class("  class  Xpto:       ").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration with a few whitespace." do
      classNameCaptured = @classPython.get_class(" class Xpto : ").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration with whitespace in the beginning." do
      classNameCaptured = @classPython.get_class(" class Xpto:").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration ended with whitespace." do
      classNameCaptured = @classPython.get_class("class  Xpto : ").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration with many whitespace." do
      classNameCaptured = @classPython.get_class(" class  Xpto  : ").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class declaration with tab." do
      classNameCaptured = @classPython.get_class("    class  Xpto  	:").name
      expect(classNameCaptured).to eq("Xpto")
    end
  end

  context "When with inheritance" do
    it "Simple class inheritance." do
      classNameCaptured = @classPython.get_class("class Xpto (Abc):").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class inheritance with whitespace in the beginning." do
      classNameCaptured = @classPython.get_class("    class   Xpto (Abc):").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class inheritance with whitespace between <." do
      classNameCaptured = @classPython.get_class("class Xpto  ( Abc ) :").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class inheritance with many whitespace." do
      classNameCaptured = @classPython.get_class("  class   Xpto ( Abc ):").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class inheritance with many whitespace between <." do
      classNameCaptured = @classPython.get_class("class Xpto    (  Abc ):").name
      expect(classNameCaptured).to eq("Xpto")
    end

    it "Class inheritance with whitespace in the corners." do
      classNameCaptured = @classPython.get_class("  class   Xpto (Abc)  :").name
      expect(classNameCaptured).to eq("Xpto")
    end
  end

  after :all do
    @classPython = nil
  end

end