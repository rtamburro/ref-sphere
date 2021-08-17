class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments
  has_many :games, through: :assignments

  def name
    name = "#{first_name.capitalize} #{last_name.capitalize} "
  end

  def written_address
    written_address = "#{address["city"]}, #{address["state"]}, #{address["zip_code"]}"
  end

  def formatted_cell_phone
    parsed_phone = Phonelib.parse(cell_phone)
    return cell_phone if parsed_phone.invalid?

    formatted =
      if parsed_phone.country_code == "1"
        parsed_phone.full_national
      else
        parsed_phone.full_international
      end
    formatted.gsub!(";", " x")
    formatted
  end

  def formatted_work_phone
    parsed_phone = Phonelib.parse(work_phone)
    return work_phone if parsed_phone.invalid?

    formatted =
      if parsed_phone.country_code == "1"
        parsed_phone.full_national
      else
        parsed_phone.full_international
      end
    formatted.gsub!(";", " x")
    formatted
  end

  def formatted_home_phone
    parsed_phone = Phonelib.parse(home_phone)
    return home_phone if parsed_phone.invalid?

    formatted =
      if parsed_phone.country_code == "1"
        parsed_phone.full_national
      else
        parsed_phone.full_international
      end
    formatted.gsub!(";", " x")
    formatted
  end

  def normalize_phone
    self.cell_phone = Phonelib.parse(cell_phone).full_e164.presence
    self.work_phone = Phonelib.parse(work_phone).full_e164.presence
    self.home_phone = Phonelib.parse(home_phone).full_e164.presence
  end

end
