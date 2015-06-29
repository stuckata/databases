CREATE TABLE Users 
	(
	Id int NOT NULL IDENTITY PRIMARY KEY,
	Username nvarchar(50) UNIQUE NOT NULL,
	UserPassword nvarchar(100) NOT NULL CHECK(LEN(UserPassword) > 4),
	FullName nvarchar(200) NOT NULL,
	LastLoginTime datetime DEFAULT GETDATE()
	)