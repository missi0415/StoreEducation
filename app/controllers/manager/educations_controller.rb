class Manager::EducationsController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @educations = @member.educations
  end
  
  
end
