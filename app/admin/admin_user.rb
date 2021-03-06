ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :avatar, :info, :occupy, :vk, :fb, :instagram, :twitter, :rss, :name, :published_at, :is_journalist

  index do
    selectable_column
    id_column
    column :name
    column :occupy
    column :is_journalist
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :published_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name, label: 'Имя'
      f.input :email, label: 'Электронная почта'
      f.input :occupy, label: 'Должность'
      f.label 'Журналист?'
      f.check_box :is_journalist
      f.input :password, label: 'Пароль'
      f.input :password_confirmation, label: 'Подтверждение пароля'
      f.input :avatar, as: :file, required: false
      f.input :info, label: 'Краткая информация'
      f.inputs 'Социальные сети' do
        f.input :vk, label: 'Вконтакте'
        f.input :fb, label: 'Facebook'
        f.input :instagram, label: 'Instagram'
        f.input :twitter, label: 'Twitter'
        f.input :rss, label: 'Лента RSS'
      end
    end
    f.actions
  end
end
