function Student(firstName, lastName) {
	this.firstName = firstName;
	this.lastName = lastName;
	this.courses = [];
}

function Course(name, dept, numCredits, meetDays, timeBlock) {
	this.name = name;
	this.dept = dept;
	this.numCredits = numCredits;
	this.students = [];
	this.meetDays = meetDays;
	this.timeBlock = timeBlock;
}
Student.prototype.name = function () {
	return `${this.firstName} ${this.lastName}`;
};

Student.prototype.enroll = function (course) {
	if (this.courses.includes(course)) return;

	this.courses.forEach((student_course) => {
		if (student_course.conflictsWith(course)) {
			throw "Course conflict!";
		}
	});
	course.students.push(this);
	this.courses.push(course);
};

Student.prototype.courseLoad = function () {
	const hash = {};
	this.courses.forEach((course) => {
		console.log(course);
		if (hash[course.dept]) hash[course.dept] += course.numCredits;
		else hash[course.dept] = course.numCredits;
	});
	return hash;
};

Course.prototype.addStudent = function (student) {
	student.enroll(this);
};

Course.prototype.conflictsWith = function (course) {
	for (let i = 0; i < this.meetDays.length; i++) {
		if (
			course.meetDays.includes(this.meetDays[i]) &&
			course.timeBlock === this.timeBlock
		)
			return true;
	}
	return false;
};

Student.prototype.hasConflict = function (course) {
	for (let i = 0; i < this.courses.length; i++) {
		if (course.conflictsWith(this.courses[i])) return true;
	}
	return false;
};

let student1 = new Student("Nigel", "Leffler");
let course1 = new Course("101", "CS", 3, ["mon", "wed", "fri"], 1);
let course2 = new Course("201", "CS", 3, ["wed"], 1);
let course3 = new Course("301", "ENG", 3, ["tue"], 1);
let course4 = new Course("401", "BIO", 3, ["mon", "wed", "fri"], 2);
console.log(student1.name());
student1.enroll(course1);
student1.enroll(course3);
// student1.enroll(course2);
console.log(student1.courseLoad());
console.log("should be true = " + course1.conflictsWith(course2));
console.log("should be false = " + course1.conflictsWith(course3));
console.log("should be false = " + course1.conflictsWith(course4));
