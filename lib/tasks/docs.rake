namespace :docs do
  desc "Auto-generate API docs from despecable usage in your controllers"
  task :generate do
    klass = Api::V3::MediaFilesController
    spectre = Class.new(klass)
    spectre.include(Despecable::Spectre)
  end
end
