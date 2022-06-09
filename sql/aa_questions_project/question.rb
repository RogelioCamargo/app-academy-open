require_relative 'questions_database'
require_relative "user"
require_relative "reply"
require_relative 'question_follow'
require_relative 'question_like'

class Question 
	attr_reader :id 
	attr_accessor :title, :body, :author_id

	def self.find_by_id(id)
		question_data = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT * FROM questions WHERE id = ? 
		SQL

		Question.new(question_data)
	end

	def self.find_by_author_id(author_id)
		questions_data = QuestionsDatabase.execute(<<-SQL, author_id)
			SELECT * FROM questions WHERE author_id = ? 
		SQL

		questions_data.map { |question_data| Question(question_data) }
	end

	def self.most_followed(n)
		QuestionFollow.most_followed_questions(n)
	end

	def self.most_liked(n)
		QuestionLike.most_liked_questions(n)
	end

	def initialize(options)
		@id = options['id']
		@title = options['title']
		@body = options['body']
		@author_id = options['author_id']
	end

	def author 
		User.find_by_id(self.author_id)
	end

	def replies 
		Reply.find_by_question_id(self.id)
	end

	def followers 
		QuestionFollow.followers_for_question_id(self.id)
	end

	def likers 
		QuestionLike.likers_for_question_id(self.id)
	end

	def num_likes 
		QuestionLike.num_likes_for_question_id(self.id)
	end
end