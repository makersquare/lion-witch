require 'spec_helper'

describe WardrobeItemsController do
  let(:valid_attributes) { { "garment" => "boots"} }

  describe 'GET index' do
    it "assigns all wardrobe items as @wardrobe_items" do
      wardrobe_item = WardrobeItem.create valid_attributes
      get :index

      expect(assigns('wardrobe_items')).to eq([wardrobe_item])
    end
  end

  describe 'GET show' do
    it "assigns the requested wardrobe item as @wardrobe_item" do
      wardrobe_item = WardrobeItem.create valid_attributes
      get :show, { id: wardrobe_item }

      expect(assigns('wardrobe_item')).to eq(wardrobe_item)
    end
  end

  describe 'GET new' do
   it "assigns a new wardrobe_item as @wardrobe_item" do
      get :new
      expect(assigns(:wardrobe_item)).to be_a_new(WardrobeItem)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new WardrobeItem" do
        expect {
          post :create, {:wardrobe_item => valid_attributes}
        }.to change(WardrobeItem, :count).by(1)
      end

      it "assigns a newly created wardrobe_item as @wardrobe_item" do
        post :create, {:wardrobe_item => valid_attributes}
        expect(assigns(:wardrobe_item)).to be_a(WardrobeItem)
        expect(assigns(:wardrobe_item)).to be_persisted
      end

      it "redirects to the created wardrobe_item" do
        post :create, {:wardrobe_item => valid_attributes}
        expect(response).to redirect_to(WardrobeItem.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved wardrobe_item as @wardrobe_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(WardrobeItem).to receive(:save).and_return(false)
        post :create, {:wardrobe_item => { "season" => "invalid value" }}
        expect(assigns(:wardrobe_item)).to be_a_new(WardrobeItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(WardrobeItem).to receive(:save).and_return(false)
        post :create, {:wardrobe_item => { "season" => "invalid value" }}
        expect(response).to render_template("new")
      end
    end
  end

  describe 'GET edit' do
    it "assigns the requested wardrobe item as @wardrobe_item" do
      wardrobe_item = WardrobeItem.create valid_attributes
      get :edit, { id: wardrobe_item }

      expect(assigns('wardrobe_item')).to eq(wardrobe_item)
    end
  end

  describe "PUT update" do
    it "assigns the requested wardrobe_item as @wardrobe_item" do
      wardrobe_item = WardrobeItem.create valid_attributes
      put :update, {:id => wardrobe_item, :wardrobe_item => valid_attributes}
      expect(assigns(:wardrobe_item)).to eq(wardrobe_item)
    end
  end

end
