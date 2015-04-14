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

  def self.first_name_labels
    ["first_name", "first name", "first"]
  end

  def self.last_name_labels
    ["last_name", "last name", "last"]
  end

  def self.full_name_labels
    ["name", "full_name", "full name"]
  end

  def self.is_valid_name(first_name, last_name)
    return (first_name and last_name)
  end

  def self.parse_full_name(curr_first_name, curr_last_name, attrs)
    first_name = curr_first_name
    last_name = curr_last_name
    for key in attrs.keys()
      if Student.full_name_labels.include?(key.to_s.downcase)
        first_and_last = attrs[key].split(" ")
        first_name = first_and_last[0]
        last_name = first_and_last[1]
      end
    end
    return first_name, last_name
  end

  def self.parse_first_and_last_name_separately(curr_first_name, curr_last_name, attrs)
    for key in attrs.keys()
      if Student.first_name_labels.include?(key.to_s.downcase)
        first_name = attrs[key]
      end
    end
    for key in attrs.keys()
      if Student.last_name_labels.include?(key.to_s.downcase)
        last_name = attrs[key]
      end
    end
    return first_name, last_name
  end

  def self.import(file, classroom_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    classroom = Classroom.find(classroom_id)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      attrs = row.to_hash
      first_name = nil
      last_name = nil
      first_name, last_name = Student.parse_first_and_last_name_separately(first_name, last_name, attrs)
      if not Student.is_valid_name(first_name, last_name)
        first_name, last_name = Student.parse_full_name(first_name, last_name, attrs)
      end
      if Student.is_valid_name(first_name, last_name)
        classroom.students.create(:first_name => first_name, :last_name => last_name)
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
