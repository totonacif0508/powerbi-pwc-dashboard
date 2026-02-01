CREATE TABLE supervisors (
    supervisor_id SERIAL PRIMARY KEY,
    supervisor_name VARCHAR(100),
    supervisor_type VARCHAR(50)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    role_type VARCHAR(50),
    specialization VARCHAR(100),
    seniority VARCHAR(50),
    hire_date DATE,
    local_supervisor_id INT REFERENCES supervisors(supervisor_id)
);

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    client_name VARCHAR(100),
    client_industry VARCHAR(100),
    billing_rate_usd NUMERIC(10,2),
    project_manager_id INT REFERENCES supervisors(supervisor_id)
);

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(100),
    role_category VARCHAR(50)
);

CREATE TABLE costs (
    cost_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    cost_per_hour_usd NUMERIC(10,2),
    valid_from DATE
);

CREATE TABLE time_entries (
    time_entry_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    project_id INT REFERENCES projects(project_id),
    date DATE,
    hours_worked NUMERIC(5,2),
    task_type VARCHAR(100),
    billable BOOLEAN
);
