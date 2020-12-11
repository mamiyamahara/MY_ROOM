# frozen_string_literal: true

require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get favorites_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get favorites_destroy_url
    assert_response :success
  end

  test 'should get likes' do
    get favorites_likes_url
    assert_response :success
  end

  test 'should get liked' do
    get favorites_liked_url
    assert_response :success
  end
end
