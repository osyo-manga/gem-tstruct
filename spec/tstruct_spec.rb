RSpec.describe TStruct do
  it "has a version number" do
    expect(Tstruct::VERSION).not_to be nil
  end

  describe ".new" do
    let(:name) { :name }
    let(:type) { Integer }
    let(:obj) { TStruct.new(name => type).new }
    subject { -> { obj.send(:"#{name}=", input) } }

    context "input is Integer" do
      let(:input) { 1 }
      it { is_expected.not_to raise_error }
      it { is_expected.to change { obj.name }.from(nil).to(1) }
    end

    context "input is String" do
      let(:input) { "homu" }
      it { is_expected.to raise_error TypeError }
    end

    context "type has `#===`" do
      context "return true" do
        let(:type) { Object.new.tap { |itself| def itself.===(*) true; end } }
        let(:input) { "homu" }
        it { is_expected.not_to raise_error }
        it { is_expected.to change { obj.name }.from(nil).to("homu") }
      end
      context "return false" do
        let(:type) { Object.new.tap { |itself| def itself.===(*) false; end } }
        let(:input) { "homu" }
        it { is_expected.to raise_error TypeError }
      end
    end
  end
end
