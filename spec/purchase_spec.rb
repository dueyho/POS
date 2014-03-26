require 'spec_helper'

describe Purchase do
  it {should have_and_belong_to_many :products}
  it {should belong_to :cashier}
end
