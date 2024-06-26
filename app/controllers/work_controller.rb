class WorkController < ApplicationController
  def index
    @images_count = Image.all.count
    @selected_theme = 'Select theme to leave your answer'
    # @selected_theme = t(".def_select_theme")
    @selected_image_name = 'радуга'
    @values_qty = Value.all.count
    @current_locale = I18n.locale
    @default_image_name = 'honda.jpg'
    session[:selected_theme_id] = @selected_theme # to display nothing
  end

  def choose_theme
    @themes = Theme.all.pluck(:name)
    respond_to :js
  end

  # @note: first display_theme and show first image from image array
  def display_theme
    @image_data = {}
    I18n.locale = session[:current_locale]

    current_user_id = current_user.id
    if params[:theme] == '-----' # .blank?
      theme = 'Select theme to leave your answer'
      theme_id = 1
      values_qty = Value.all.count.round
      data = { index: 0, name: 'Honda NSX NA2', values_qty:,
               file: 'honda.jpg', image_id: 1,
               current_user_id:, user_valued: false,
               common_ave_value: 0, value: 0 }
    else
      theme = params[:theme]
      theme_id = Theme.find_theme_id(theme)
      data = show_image(theme_id, 0)
    end
    session[:selected_theme_id] = theme_id
    image_data(theme, data)
  end
end
