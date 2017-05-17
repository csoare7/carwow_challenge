require "spec_helper"

describe Bitmap do 
  
  describe "#initialize" do
    it "should init bitmap with pixels with nil value" do
      expect(subject.pixels).to eq(nil)
    end
  end

  describe "#init_pixels" do
    it "should create 2D array of length MxN with 0 values" do
      subject.init_pixels(3,3)
      expect(subject.pixels.length).to eq(3)
      expect(subject.pixels).to all match_array([0,0,0])
    end
  end

  describe "#set_pixel" do
    it "should set pixel at positions M,N (start at 1,1) with colour C" do
      subject.init_pixels(3,3)
      subject.set_pixel([1,1],"A")
      expect(subject.pixels[0][0]).to eq("A")
    end
  end

  describe "#delete_pixels" do
    it "should set all current pixels to 0" do
      subject.init_pixels(3,3)
      subject.set_pixel([1,1],"A")
      subject.delete_pixels
      expect(subject.pixels).to all match_array([0,0,0])  
    end
  end

  describe "#set_vertical_segment" do
    it "should set a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)" do
      subject.init_pixels(3,3)
      subject.set_vertical_segment(1, [1,3], "A")
      expect(subject.pixels[0][0]).to eq("A")
      expect(subject.pixels[1][0]).to eq("A")
      expect(subject.pixels[2][0]).to eq("A")
    end
  end

  describe "#set_horizontal_segment" do
    it "should set a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)" do
      subject.init_pixels(3,3)
      subject.set_horizontal_segment(1, [1,3], "A")
      expect(subject.pixels[0]).to match_array(["A", "A", "A"])
    end
  end
end