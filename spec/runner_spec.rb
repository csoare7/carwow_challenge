require "spec_helper"

describe Runner do
	let(:bitmap_editor) { BitmapEditor.new }

	describe "#execute" do
		it "should call bitmap#create_image on command I" do
			expect(subject.bitmap_editor).to receive(:create_image)
			subject.execute("I 2 2")
		end

		it "should call bitmap#clear_image on input C" do
			expect(subject.bitmap_editor).to receive(:clear_image)
			subject.execute("C")
		end

		it "should call bitmap#colour_pixel on input C" do
			expect(subject.bitmap_editor).to receive(:colour_pixel)
			subject.execute("L 1 1 A")
		end
		it "should call bitmap#draw_vertical on input V" do
			expect(subject.bitmap_editor).to receive(:draw_vertical)
			subject.execute("V 1 1 2 A")
		end

		it "should call bitmap#draw_horizontal on input H" do
			expect(subject.bitmap_editor).to receive(:draw_horizontal)
			subject.execute("H 1 1 2 A")
		end	
		it "should call self#help on input ?" do
			expect(subject).to receive(:help)
			subject.execute("?")
		end	
		it "should call self#quit on input X" do
			expect(subject).to receive(:quit)
			subject.execute("X")
		end	
	end
end