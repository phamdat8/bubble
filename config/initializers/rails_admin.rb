RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.authorize_with do
    redirect_to '/' unless current_user.is_admin?
  end

  config.model 'ActiveStorage::Blob' do
    visible false
  end

  config.model 'ActiveStorage::Attachment' do
    visible false
  end

  config.model 'ActiveStorage::VariantRecord' do
    visible false
  end

  config.model 'Record' do
    visible false
  end


  config.model 'User' do
    create do
      field :name
      field :email
      field :password
    end

    list do
      field :id
      field :name
      field :email
    end
    
    label_plural 'Tài khoản'
    navigation_label 'Người dùng'
  end

  config.model 'Answer' do
    label_plural 'Câu trả lời'
    navigation_label 'Chương trình học'
  end

  config.model 'Question' do
    label_plural 'Câu hỏi'
    navigation_label 'Chương trình học'
  end

  config.model 'Category' do
    label_plural 'Chương học'
    navigation_label 'Chương trình học'
  end

  config.model 'Lesson' do
    label_plural 'Bài học'
    navigation_label 'Chương trình học'
  end

  config.model 'Document' do
    label_plural 'Tài liệu'
    navigation_label 'Người dùng'
  end

  config.model 'Complete' do
    label_plural 'Tiến trình'
    navigation_label 'Khác'
  end

  config.model 'Comment' do
    label_plural 'Bình luận'
    navigation_label 'Khác'
  end

  config.model 'Post' do
    label_plural 'Bình luận'
    navigation_label 'Khác'
  end

  


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
