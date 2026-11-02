
CREATE TABLE Class (
    ClassId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ClassName VARCHAR(50) NULL,
    CreateDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Department (
    DeptId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DeptName VARCHAR(50) NULL,
    CreateDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Course (
    CourseId INT PRIMARY KEY IDENTITY,
    CourseName VARCHAR(100),
);

CREATE TABLE Department_Course (
    Id INT PRIMARY KEY IDENTITY,
    CourseId INT NOT NULL FOREIGN KEY REFERENCES Course(CourseId),
    DeptId INT NOT NULL FOREIGN KEY REFERENCES Department(DeptId),
    CreateDate DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_Department_Course UNIQUE (CourseId, DeptId)
);


CREATE TABLE Lecturer_Class (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ClassId INT FOREIGN KEY REFERENCES Class(ClassId) NULL,
    LecturerId INT FOREIGN KEY REFERENCES Lecturer(LecturerId) NULL,
    CreateDate DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_Lecturer_Class UNIQUE (ClassId, LecturerId)
);

CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL,  -- Instead of ENUM, we use VARCHAR to store 'Student' or 'Teacher'
    IsVerified BIT DEFAULT 0,    -- IsVerified will be a BIT (boolean) field
    CreateDate DATETIME DEFAULT GETDATE()
);


CREATE TABLE Lecturer (
    LecturerId INT PRIMARY KEY IDENTITY,
    LecturerName VARCHAR(50) not null,
    LecturerDOB DATE null,
    LecturerGender VARCHAR(50) null,
    LecturerAddress VARCHAR(255) null,
    DeptId INT FOREIGN KEY REFERENCES Department(DeptId) not null,
    UserId INT FOREIGN KEY REFERENCES Users(UserId) not null
);
CREATE TABLE Student (
    StudentId INT PRIMARY KEY IDENTITY,
    StudentName VARCHAR(50) null,
    StudentDOB DATE null,
    StudentGender VARCHAR(50) null,
    StudentAddress VARCHAR(255) null,
    ClassId INT FOREIGN KEY REFERENCES Class(ClassId) not null,
    DeptId INT FOREIGN KEY REFERENCES Department(DeptId) not null,
    UserId INT FOREIGN KEY REFERENCES Users(UserId) not null
);

CREATE TABLE Admins (
    AdminId INT PRIMARY KEY IDENTITY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(50) DEFAULT 'Admin' -- Fixed value for Admin
);

CREATE TABLE Exam (
    ExamId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ExamName VARCHAR(50) NOT NULL,
    ExamInfo VARCHAR(MAX) NULL,
    StartDate DATE NOT NULL,
    Duration TIME NOT NULL,
    EachQueMark INT NOT NULL,
    Token VARCHAR(9) NOT NULL,
    ClassId INT FOREIGN KEY REFERENCES Class(ClassId) NOT NULL,
    CourseId INT FOREIGN KEY REFERENCES Course(CourseId) NOT NULL,
    CreateDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE QuestionPaper (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ExamId INT NOT NULL FOREIGN KEY REFERENCES Exam(ExamId),
    QueNo INT NOT NULL,
    QueName NVARCHAR(255) NOT NULL,
    QueOp1 NVARCHAR(100) NOT NULL,
    QueOp2 NVARCHAR(100) NOT NULL,
    QueOp3 NVARCHAR(100) NOT NULL,
    QueOp4 NVARCHAR(100) NOT NULL,
    CorrectAns INT NOT NULL,
    CreateDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Result (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ExamId INT NOT NULL FOREIGN KEY REFERENCES Exam(ExamId),
    StudId INT NOT NULL FOREIGN KEY REFERENCES Student(StudentId),
    TotalQueMark INT NOT NULL,
    FinalMark INT NOT NULL,
    Status VARCHAR(5) CHECK(Status IN ('Pass', 'Fail')),  -- Status field (Pass/Fail)
    DateAnswered DATETIME DEFAULT GETDATE()
);


