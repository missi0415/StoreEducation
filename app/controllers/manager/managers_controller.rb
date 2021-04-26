class Manager::ManagersController < ApplicationController
before_action :authenticate_manager!
end
