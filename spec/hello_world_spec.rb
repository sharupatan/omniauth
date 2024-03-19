require './app/controllers/home_controller'

describe HomeController do
    context "when testing this class," do
        it "should say 'in home' when called index" do
            hw = HomeController.new
            msg = hw.index
            expect(msg).to eql "in home"
        end

        it "should not say 'in home' when called index" do
            hw = HomeController.new
            msg = hw.index
            expect(msg).not_to eql "in home!"
        end

        it "test cases" do
            a = 'test'
            b = a
            expect(a).to eq 'test'
            expect(a).to eql 'test'
            expect(a).to be b
            expect(a).to equal b
        end

        it 'comparision' do
            a = 1
            b = 2
            c = 3
            expect(a).to be < b
            expect(a).to be_between(0,5).inclusive
        end

        it 'class/type' do
            expect(1).to be_instance_of Fixnum
            expect([]).to respond_to(:length)
        end

        it 'bool' do
            expect(true).to be true
            expect(1).to be_truthy
            expect(nil).to be_nil
        end

        it 'error' do
            expect {1/0}.to raise_error(ZeroDivisionError)
        end
    end
end