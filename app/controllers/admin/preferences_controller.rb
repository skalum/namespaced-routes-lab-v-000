class Admin::PreferencesController < ApplicationController

  def index
    @preferences = Admin::Preference.first_or_create(
      artist_sort_order: "ASC",
      song_sort_order: "ASC",
      allow_create_artists: true,
      allow_create_songs: true
    )
  end

  def update
    @preferences = Admin::Preference.find(params[:id])
    @preferences.update(preferences_params)
    redirect_to admin_preferences_path
  end

  private

  def preferences_params
    params.require(:admin_preference).permit(:allow_create_songs, :allow_create_artists, :song_sort_order, :artist_sort_order)
  end

end
