INSERT INTO job_categories (name) VALUES
    ('Technology'),
    ('Healthcare'),
    ('Finance'),
    ('Education'),
    ('Sales'),
    ('Marketing'),
    ('Engineering'),
    ('Hospitality'),
    ('Art'),
    ('Manufacturing');

INSERT INTO company_categories (name) VALUES
    ('IT'),
    ('Healthcare'),
    ('Banking'),
    ('Consulting'),
    ('Retail'),
    ('Automotive'),
    ('Hospitality'),
    ('Education'),
    ('Media'),
    ('Construction');

INSERT INTO cities (name) VALUES
    ('New York'),
    ('Los Angeles'),
    ('London');

INSERT INTO advances (name, description) VALUES
    ('Certification', 'Relevant certification'),
    ('Experience', 'Years of experience'),
    ('Language Skills', 'Proficiency in different languages'),
    ('Management Skills', 'Leadership and managerial experience'),
    ('Technical Skills', 'Specialized technical skills'),
    ('Analytical Skills', 'Ability to analyze data and make informed decisions'),
    ('Problem-Solving Skills', 'Capability to identify and solve complex problems'),
    ('Creativity', 'Innovative and imaginative thinking'),
    ('Communication Skills', 'Effective verbal and written communication'),
    ('Teamwork', 'Collaboration and cooperation in a team environment');

INSERT INTO companies (name, category, description, location) VALUES
    ('ABC Technologies', 'IT', 'Leading technology company', 'New York'),
    ('XYZ Healthcare', 'Healthcare', 'Medical services provider', 'Los Angeles'),
    ('Global Bank', 'Banking', 'International banking institution', 'London'),
    ('Consulting Experts', 'IT', 'Management consulting firm', 'New York'),
    ('Super Mart', 'IT', 'Supermarket chain', 'New York'),
    ('Tech Innovators', 'IT', 'Cutting-edge technology solutions provider', 'New York'),
    ('Health First', 'Healthcare', 'Healthcare organization focused on patient well-being', 'Los Angeles'),
    ('Finance Solutions', 'Banking', 'Financial advisory and planning services', 'Los Angeles'),
    ('EduCorp', 'IT', 'Educational institution dedicated to knowledge advancement', 'Los Angeles'),
    ('Global Media', 'IT', 'Media conglomerate with a global presence', 'London');

INSERT INTO users (name, resume, phone_number, education_tier, email, password_hash, city) VALUES
    ('John Doe', 'resume1.pdf', '1234567890', 2, 'john.doe@example.com', 'password123', 'New York'),
    ('Jane Smith', 'resume2.pdf', '9876543210', 3, 'jane.smith@example.com', 'password456', 'London'),
    ('Michael Johnson', 'resume3.pdf', '5555555555', 4, 'michael.johnson@example.com', 'password789', 'Los Angeles'),
    ('Sarah Williams', 'resume4.pdf', '1111111111', 2, 'sarah.williams@example.com', 'passwordabc', 'New York'),
    ('Robert Brown', 'resume5.pdf', '9999999999', 3, 'robert.brown@example.com', 'passworddef', 'New York'),
    ('Emily Wilson', 'resume6.pdf', '7777777777', 4, 'emily.wilson@example.com', 'passwordxyz', 'New York'),
    ('David Lee', 'resume7.pdf', '4444444444', 3, 'david.lee@example.com', 'password456', 'Los Angeles'),
    ('Jennifer Chen', 'resume8.pdf', '2222222222', 2, 'jennifer.chen@example.com', 'password123', 'Los Angeles'),
    ('Amit Patel', 'resume9.pdf', '6666666666', 4, 'amit.patel@example.com', 'password789', 'Los Angeles'),
    ('Fatima Al-Saud', 'resume10.pdf', '8888888888', 3, 'fatima.alsaud@example.com', 'passwordabc', 'Los Angeles');

INSERT INTO jobs (owner, status, title, category, description, min_salary, max_salary, minimum_education, urgent) VALUES
    (1, 'active', 'Software Engineer', 'Technology', 'Develop and maintain software applications', 60000, 80000, 2, false),
    (2, 'active', 'Nurse', 'Healthcare', 'Provide medical care to patients', 50000, 70000, 3, false),
    (3, 'active', 'Financial Analyst', 'Finance', 'Analyze financial data and prepare reports', 70000, 90000, 4, true),
    (1, 'active', 'Teacher', 'Technology', 'Educate and inspire students', 40000, 60000, 2, false),
    (5, 'active', 'Sales Associate', 'Sales', 'Assist customers and promote products', 30000, 50000, 2, true),
    (1, 'active', 'Frontend Developer', 'Technology', 'Create user-friendly interfaces for web applications', 60000, 80000, 3, false),
    (7, 'active', 'Doctor', 'Healthcare', 'Provide medical diagnosis and treatment', 80000, 120000, 5, true),
    (8, 'active', 'Financial Advisor', 'Finance', 'Offer financial guidance and investment recommendations', 70000, 100000, 4, false),
    (1, 'active', 'School Teacher', 'Technology', 'Deliver academic lessons and foster student development', 35000, 55000, 2, false),
    (1, 'active', 'Marketing Manager', 'Finance', 'Develop and execute marketing strategies', 50000, 80000, 3, true);

INSERT INTO job_advances (job_id, advance, is_required) VALUES
  (1, 'Certification', true),
  (1, 'Experience', true),
  (2, 'Certification', true),
  (2, 'Experience', true),
  (3, 'Experience', true),
  (4, 'Certification', false),
  (5, 'Experience', false),
  (6, 'Experience', true),
  (6, 'Technical Skills', true),
  (7, 'Certification', true),
  (7, 'Experience', true),
  (8, 'Certification', false),
  (8, 'Analytical Skills', false),
  (9, 'Certification', false),
  (10, 'Experience', true),
  (10, 'Communication Skills', true);

INSERT INTO user_advances (user_id, advance) VALUES
  (1, 'Certification'),
  (2, 'Experience'),
  (3, 'Certification'),
  (4, 'Language Skills'),
  (5, 'Management Skills'),
  (6, 'Technical Skills'),
  (7, 'Certification'),
  (8, 'Experience'),
  (9, 'Certification'),
  (10, 'Communication Skills'),
  (1, 'Analytical Skills'),
  (2, 'Language Skills'),
  (3, 'Management Skills'),
  (4, 'Technical Skills'),
  (5, 'Experience'),
  (6, 'Certification'),
  (7, 'Problem-Solving Skills'),
  (8, 'Analytical Skills'),
  (9, 'Creativity'),
  (10, 'Teamwork');

INSERT INTO applications (status, user_id, job_id) VALUES
  ('created', 1, 1),
  ('created', 2, 2),
  ('created', 3, 3),
  ('created', 4, 4),
  ('created', 5, 5),
  ('created', 6, 6),
  ('created', 7, 7),
  ('created', 8, 8),
  ('created', 9, 9),
  ('created', 10, 10),
  ('created', 1, 2),
  ('created', 2, 3),
  ('created', 3, 4),
  ('created', 4, 5),
  ('created', 5, 6),
  ('created', 6, 7),
  ('created', 7, 8),
  ('created', 8, 9),
  ('created', 9, 10),
  ('created', 10, 1);

