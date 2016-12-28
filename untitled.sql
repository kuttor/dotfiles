set @project_name = 'TEPS';
set @env_id = 3;

select c.name, p.name
from contact c
left join xref_contact_in_project xcp on xcp.contact_id = c.id
left join project p on p.id = xcp.project_id
where p.name = @project_name;

select c.name, env.name
from contact c
left join xref_contacts_in_env xce on xce.contact_id = c.id
left join env on env.id = xce.env_id
where env.id = 3;

select p.name, env.name
from project p
left join xref_projects_in_env xpe on xpe.project_id = p.id
left join env on env.id = xpe.env_id
where env.id = 3;

