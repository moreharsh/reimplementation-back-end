module StudentTeamsHelper
    private
    
    def set_team
      @team = AssignmentTeam.find(params[:team_id])
    end
  
    def set_all_teams
      @all_teams = AssignmentTeam.all
    end 
  
    def current_team
      AssignmentTeam.find(params[:id])
    end
  
    def set_student
      @student = AssignmentParticipant.find(params[:student_id])
    end
  
    def generate_team_name
      loop do
        suffix = rand(1..999)
        team_name = "Team_#{suffix}"
        break team_name unless AssignmentTeam.exists?(name: team_name)
      end
    end
  
    def user_not_found
      render json: { error: "User with id #{params[:id]} not found" }, status: :not_found
    end
  
    def parameter_missing(exception)
      render json: { error: "Parameter missing: #{exception.param}" }, status: :unprocessable_entity
    end
  end