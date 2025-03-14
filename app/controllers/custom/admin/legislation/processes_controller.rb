require_dependency Rails.root.join("app", "controllers", "admin", "legislation", "processes_controller").to_s

class Admin::Legislation::ProcessesController
  def download
    respond_to do |format|
      format.zip do
        filename = "process_#{@process.id}.zip"
        send_data ::Legislation::Processes::Exporter.new(@process).to_zip, type: "application/zip",
                                                                           disposition: "attachment",
                                                                           filename: filename
      end
    end
  end

  private

    alias_method :consul_allowed_params, :allowed_params

    def allowed_params
      consul_allowed_params + [:tag_list]
    end
end
