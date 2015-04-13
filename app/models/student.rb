class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, :through => :classroom_students
  has_many :surveys
  attr_accessible :age, :ethnicity, :gender, :first_name, :last_name


  def name
    self.first_name + ' ' + self.last_name
  end

  def get_survey(survey_type)
    self.surveys.each do |survey|
      if survey.survey_type == survey_type
        return survey
      end
    end
    nil
  end

  def get_survey_score(survey_type)
    survey = get_survey(survey_type)
    if survey
      survey.score
    else
      "N/A"
    end
  end

  def self.import(file, classroom_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    classroom = Classroom.find(classroom_id)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      student = find_by_id(row["id"]) || new
      student.attributes = row.to_hash.slice(*accessible_attributes)
      student.save!
      classroom.students << student
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
