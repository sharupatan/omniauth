class ClassRoom
    def initialize(students)
        @students = students
    end

    def list_student_names
        @students.map(&:name).join(',')
    end
end

class Person
    attr_reader :firstname, :lastname

    def initialize(firstname, lastname)
        @firstname = firstname
        @lastname = lastname
    end
end

describe Person.new 'sharu', 'khan' do
    it { is_expected.to have_attributes(firstname: 'sharu') }
    it { is_expected.to have_attributes(lastname: 'khan') }
end

describe 'Tags' do
    it 'slow tags', slow: true do
        sleep(1)
        puts 'slow tests!'
    end

    it 'fast tags', fast: true do
        puts 'fast tests!'
    end
end

describe 'Hooks' do
    before(:each) do
        puts 'runs before each it'
    end

    after(:each) do
        puts 'runs after each it'
    end

    it 'first' do
        puts 'first it'
    end

    it 'second' do
        puts 'second it'
    end

    before(:all) do
        puts 'runs before all'
    end

    after(:all) do
        puts 'runs after all'
    end
end

describe ClassRoom do
    context 'when testing this class,' do
        it 'doubles' do
            student1 = double('student')
            student2 = double('student')

            allow(student1).to receive(:name) {'Sharu'}
            allow(student2).to receive(:name) {'Khan'}

            cr = ClassRoom.new [student1, student2]
            expect(cr.list_student_names).to eq('Sharu,Khan')
        end
    end
end

describe 'HomeController' do
    context "when testing this class," do
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