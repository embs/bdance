namespace :bootstrap do
  desc 'Create pupils'
  task pupils: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['pupils'].each do |n, attrs|
      Pupil.create(attrs)
    end
  end

  desc 'Create teachers'
  task teachers: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['teachers'].each do |n, attrs|
      Teacher.create(attrs)
    end
  end

  desc 'Create managers'
  task managers: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['managers'].each do |n, attrs|
      Manager.create(attrs)
    end
  end

  desc 'Create modalities'
  task modalities: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['modalities'].each do |n, attrs|
      Modality.create(attrs)
    end
  end

  desc 'Create rhythms'
  task rhythms: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['rhythms'].each do |n, attrs|
      Rhythm.create(attrs.merge(modality: Modality.find_by_name(attrs['modality']['name'])))
    end
  end

  desc 'Create groups'
  task groups: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['groups'].each do |n, attrs|
      Group.create(attrs.merge(modality: Modality.find_by_name(attrs['modality']['name'])).
        merge(teacher: Teacher.find(Employee.find(User.find_by_username(attrs['teacher']['username']).as_user_id).as_employee_id)))
    end
  end

  desc 'Create enrollments'
  task enrollments: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['enrollments'].each do |n, attrs|
      Enrollment.create(attrs.merge(pupil: Pupil.find(User.find_by_username(attrs['pupil']['username']).as_user_id)).
        merge(group: Group.find_by_name(attrs['group']['name'])))
    end
  end

  desc 'Create hours packages'
  task hours_packages: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['hours_packages'].each do |n, attrs|
      pupils = attrs['pupils'].collect { |k,v| Pupil.find(User.find_by_username(v['username']).as_user_id) }
      hp = HoursPackage.create(attrs.merge(teacher: Teacher.find(Employee.find(User.find_by_username(attrs['teacher']['username']).as_user_id).as_employee_id)).
        merge(pupils: pupils))
    end
  end

  desc 'Create presences'
  task presences: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['presences'].each do |n, attrs|
      Presence.create(attrs.merge(user: User.find_by_username(attrs['user']['username'])))
    end
  end

  desc 'Create events'
  task events: :environment do
    hash = YAML.load(File.read(Rails.root.join('lib', 'tasks', 'data.yml')))
    hash['events'].each do |n, attrs|
      Event.create(attrs)
    end
  end

  desc "Run all bootstrapping tasks"
  task all: [:pupils, :teachers, :managers, :modalities, :rhythms, :groups,
                :enrollments, :hours_packages, :presences, :events]
end
