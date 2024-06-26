class ApiController < ApplicationController
  include WorkImage

  def next_image
    current_index = params[:index].to_i
    theme_id = params[:theme_id].to_i
    length = Image.theme_images(theme_id).size

    new_image_index = next_index(current_index, length)
    logger.debug "new_image_index: #{new_image_index.inspect}"
    next_image_data = show_image(theme_id, new_image_index)

    respond_to do |format|
      if new_image_index.blank?
        format.json { render json: { kek: 2 }, status: :unprocessable_entity }
        format.html { render json: { kek: 2 }, status: :unprocessable_entity }
      else
        format.json do
          render json: {
            new_image_index: next_image_data[:index],
            name: next_image_data[:name],
            file: next_image_data[:file],
            image_id: next_image_data[:image_id],
            user_valued: next_image_data[:user_valued],
            common_ave_value: next_image_data[:common_ave_value],
            value: next_image_data[:value],
            status: :ok,
            notice: 'Successfully listed to next'
          }
        end
        format.html do
          render json: {
            new_image_index: next_image_data[:index],
            name: next_image_data[:name],
            file: next_image_data[:file],
            image_id: next_image_data[:image_id],
            user_valued: next_image_data[:user_valued],
            common_ave_value: next_image_data[:common_ave_value],
            value: next_image_data[:value],
            status: :ok,
            notice: 'Successfully listed to next'
          }, status: :unprocessable_entity
        end
      end
    end
  end

  def next_index(index, length)
    new_index = index
    index < length - 1 ? new_index += 1 : new_index = 0
    logger.debug "new_index: #{new_index}"
    new_index
  end

  def prev_index(index, length)
    new_index = index
    index.positive? ? new_index -= 1 : new_index = length - 1
    new_index
  end
end
