# frozen_string_literal: true

json.count Like.where(output_id: params[:id]).count
