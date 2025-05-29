require 'rails_helper'

RSpec.describe "Api::V1::Mice", type: :request do
  describe "GET /api/v1/mice" do
    let!(:mice) { create_list(:mouse, 4) }
    let!(:baby_mouses) do
      mice.each do |mouse|
        create_list(:baby_mouse, 10, mouse: mouse)
      end
    end

    it "returns all mice with their baby mouses" do
      log_and_warn_n_plus_one do
        get "/api/v1/mice"
      end

      json = JSON.parse(response.body)
      expect(json.length).to eq(4)
      expect(json.first["baby_mouses"].length).to eq(10)
    end
  end

  describe "GET /api/v1/mice/counts" do
    let!(:mice) { create_list(:mouse, 4) }
    let!(:baby_mouses) do
      mice.each do |mouse|
        create_list(:baby_mouse, 10, mouse: mouse)
      end
    end

    it "returns all mice with their baby_mouses count" do
      log_and_warn_n_plus_one do
        get "/api/v1/mice/counts"
      end

      json = JSON.parse(response.body)
      expect(json.length).to eq(4)
      expect(json.first["baby_mouses_count"]).to eq(10)
    end
  end
end
