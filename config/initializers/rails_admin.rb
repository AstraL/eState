RailsAdmin.config do |config|

  config.main_app_name = ["e-State", I18n.t('titles.admin')]

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.excluded_models = ["City", "District", "Region", "Microdistrict"]

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index
    grid do
		    except ['Post', 'Category', 'Feedback']
    end
    new do
        except ['Ckeditor::Asset', 'Ckeditor::Picture', 'Ckeditor::AttachmentFile']
    end
    export do
		    except ['Ckeditor::Asset', 'Ckeditor::Picture', 'Ckeditor::AttachmentFile']
    end
    bulk_delete
    show do
		    except ['Post', 'Category','Ckeditor::Asset', 'Ckeditor::Picture', 'Ckeditor::AttachmentFile']
    end
    edit
    delete
    show_in_app do
        except ['Ckeditor::Asset', 'Ckeditor::Picture', 'Ckeditor::AttachmentFile']
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
