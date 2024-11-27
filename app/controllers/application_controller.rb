class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def current_user
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  def authenticate_user
    unless current_user
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def authorize_admin!
    unless current_user&.admin?
      render json: { error: "Admin access required" }, status: :forbidden
    end
  end

  # Helper method to check specific roles
  def require_role(*roles)
    unless current_user && roles.any? { |role| current_user.send("#{role}?") }
      render json: {
        error: "Access denied",
        required_roles: roles
      }, status: :forbidden
    end
  end

  # Helper to check for specific permissions
  def check_resource_owner(resource)
    unless current_user && (current_user.admin? || resource.user_id == current_user.id)
      render json: { error: "Not authorized to access this resource" }, status: :forbidden
    end
  end

  private

  def user_not_authorized
    render json: {
      error: "You are not authorized to perform this action"
    }, status: :forbidden
  end
end
