require "spec_helper"

describe BitmapEditor do 
	let(:bitmap_editor) { BitmapEditor.new }

	describe "#create_image" do
		it "should reject input if args.length != 2" do
			expect do 
				subject.create_image(["3"])
			end.to output("Wrong number of arguments\n").to_stdout
		end
		
		it "should reject input if args types are not Integer" do
			expect do 
				subject.create_image(["3","A"])
			end.to output("Wrong argument type, please supply only integers\n").to_stdout
		end

		it "should reject input if args range is not (1..250)" do
			expect do 
				subject.create_image(["0","251"])
			end.to output("Bitmap size not in range. Please supply a number between 1 and 250\n").to_stdout
		end
	end

	describe "#colour_pixel" do
		it "should reject input if args.length != 3" do
			expect do 
				subject.colour_pixel(["3"])
			end.to output("Wrong number of arguments\n").to_stdout
		end		
		
		it "should reject input if args types are not Integer" do
			expect do 
				subject.colour_pixel(["3","A","3"])
			end.to output("Wrong argument type, please supply only integers for coordinates\n").to_stdout
		end

		it "should reject colour input if not capital letter" do
			expect do 
				subject.colour_pixel(["3","3","0"])
			end.to output("Wrong argument type, please supply only capital letters for colour\n").to_stdout
		end
	end

	describe "#draw_vertical" do
		it "should reject input if args.length != 4" do
			expect do 
				subject.draw_vertical(["3"])
			end.to output("Wrong number of arguments\n").to_stdout
		end		
		
		it "should reject input if args types are not Integer" do
			expect do 
				subject.draw_vertical(["3","A","3","A"])
			end.to output("Wrong argument type, please supply only integers for coordinates\n").to_stdout
		end

		it "should reject colour input if not capital letter" do
			expect do 
				subject.draw_vertical(["1","3","3","0"])
			end.to output("Wrong argument type, please supply only capital letters for colour\n").to_stdout
		end
	end

	describe "#draw_horizontal" do
		it "should reject input if args.length != 4" do
			expect do 
				subject.draw_horizontal(["3"])
			end.to output("Wrong number of arguments\n").to_stdout
		end		
		
		it "should reject input if args types are not Integer" do
			expect do 
				subject.draw_horizontal(["3","A","3","A"])
			end.to output("Wrong argument type, please supply only integers for coordinates\n").to_stdout
		end

		it "should reject colour input if not capital letter" do
			expect do 
				subject.draw_horizontal(["1","3","3","0"])
			end.to output("Wrong argument type, please supply only capital letters for colour\n").to_stdout
		end
	end
end