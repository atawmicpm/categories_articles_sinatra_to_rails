require 'CSV'

def scrub_title(title)
	title.titleize
end

def scrub_category(category)
	category = category.pluralize if category =~ /sport/
	category.titleize
end

def scrub_tags(tags)
	tags.gsub(/-tags/, '')

end

def create_tags(tags)
	tags.split(', ')
end

def parse_csv(file)

	csv = CSV.open(file, :col_sep => "\t")

	csv.each do |row|
		scrub_category(row[3])
		p category = Category.find_or_create_by(name: scrub_category(row[3]))

		article = Article.create(
			title: scrub_title(row[0]), 
			description: row[1], 
			url: row[2], 
			category: category)

		unless row[4].nil?
			tags = create_tags(scrub_tags(row[4]))
			tags.map { |tag| p article.tags << Tag.find_or_create_by_name(tag) }
		end

	end
end


parse_csv('db/articles.sql')