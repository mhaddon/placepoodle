require 'sinatra'

class PlacePoodle < Sinatra::Base
  get '/' do
    erb :index;
  end
  get '/:x/:y' do
    x = params[:x].to_f;
    y = params[:y].to_f;

    poodles = [];
    poodles << Poodle.new("http://101doggy.com/wp-content/uploads/2016/03/shih-tzu-toy-poodle-mix.jpg", 800, 600);
    poodles << Poodle.new("http://www.yourpurebredpuppy.com/dogbreeds/photos-MNOP/miniaturepoodles-buffy2.jpg", 346, 214);
    poodles << Poodle.new("https://pbs.twimg.com/profile_images/597861641787584512/arEacZQI.jpg", 512, 512);
    poodles << Poodle.new("http://www.yourpurebredpuppy.com/dogbreeds/photos-RS/standardpoodlesf3.jpg", 350, 226);
    poodles << Poodle.new("http://petattack.com/wp-content/uploads/2014/06/poodles.jpg", 500, 378);
    poodles << Poodle.new("http://www.blogcdn.com/www.pawnation.com/media/2009/09/poodle-puppies-black-white-425ds090109.jpg", 425, 270);
    poodles << Poodle.new("http://petattack.com/wp-content/uploads/2014/06/poodle-puppies.jpg", 640, 571);
    poodles << Poodle.new("http://www.smpoodle.com/poodlefront.jpg", 288, 305);
    poodles << Poodle.new("http://img2.rnkr-static.com/user_node_img/50023/1000440440/870/four-poodle-pups-photo-u1.jpg", 823, 550);
    poodles << Poodle.new("http://www.petinsurance.com/healthzone/pet-articles/pet-breeds/~/media/All%20PHZ%20Images/Article%20images/177poodlepuppy2.ashx", 266, 299);

    res = (x / y).to_f;

    closestItem = 0;
    closestDist = 1000.0;

    poodles.each_with_index { |poodle, index|
        dist = (res - poodle.ratio).abs
        if dist < closestDist
            closestDist = dist;
            closestItem = index;
        end
    }
    redirect poodles[closestItem].url;
  end
end

class Poodle
  @@array = Array.new
  attr_accessor :url, :ratio, :width, :height

  def self.all_instances
    @@array
  end

  def initialize(url, width, height)
    @url = url
    @ratio = width.to_f / height.to_f
    @width = width
    @height = height
    @@array << self
  end
end

