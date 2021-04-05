require_relative '../lib/app'

RSpec.describe App do
    subject(:app){
        described_class.new
    }
    it 'should be instance of App' do
        expect(app).to be_a App
    end

    it 'should have an empty task list' do
        expect(app.tasks).to eq []
    end
        context 'adding a task' do
            it 'should be able to add a task' do
                app.add_task('Create a terminal app')
                expect(app.tasks.last).to eq({ task: 'Create a terminal app', completed: false })
            
        end
        it 'should ask user the input' do
            expected_output = "Enter the task name\n"
             expect{ app.display_add_task }.to output(expected_output).to_stdout
        end

        let(:input) { StringIO.new('test task') } 
        it 'should be albe to receive task from terminal'do
          $stdin = input
          expect(app.task_add).to eq('test task')  
        end
       

    end

    context 'display tast' do
        before(:each) do
            app.tasks = [{tasks: 'test task', completed: false}]
        end
        it 'should display all tasks' do
            expected_output = "Tasks:\n1. test task [ ]\n"
            expect{ app.display_tasks }.to output(expected_output).to_stdout
        end
    end

    
end