select * from project 
where name in 
('ADE', 'IGLU','API Gateway', 'ASFT', 'Bletchley Park',
'CICD', 'DPP', 'Enrollment Service', 'Esignature Service',
'FAS', 'ISP', 'ISPC', 'Invoice Tracker', 'Kobayashi',
'Linkadaptor', 'Mobile Services', 'Obill', 'Offering Messaging',
'Olympus', 'Phone Identity', 'SOA', 'T360', 'TEPS',
'TFS', 'Task Service', 'Trinity', 'UIOT', 'Voyager',
'Zeropaper', 'Secret Management', 'Link');


select count(*)
from xref_projects_in_env
where env_id = 2;

SELECT p.name, p.id
from project p
left join xref_projects_in_env xpe
on xpe.project_id = p.id
left join env e
on e.id = xpe.env_id
where env = 2;