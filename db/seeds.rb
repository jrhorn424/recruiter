
%w[Economics Psychology Sociology Science/Engineering Math Other].each do |feature|
  Major.create({ name: feature })
end
ClassYear.create([{ name: 'Freshman', year: 1 },
                  {name: 'Sophomore', year: 2},
                  {name: 'Junior', year: 3},
                  {name: 'Senior', year: 4},
                  {name: 'Graduate Student', year: 5}])
(['Part-time student', 'Full time student', 'University staff', 'Faculty', 'Visiting student', 'Other']).each do |feature|
  Profession.create({ name: feature })
end
(['White', 'Black', 'Asian', 'Hispanic', 'Other']).each do |feature|
  Ethnicity.create({ name: feature })
end
(['confirm', 'deactivation', 'invite', 'reset', 'unlock']).each do |email|
  Email.create({ id: email })
end
%[Fairfax Krasnow].each do |f|
  Lab.create({name: f})
end
Email.create([
                 { id: 'confirm' },
                 { id: 'reset', value: '## Your password has been reseted on the ICES Recruiter!
[Come on](@url) to change your password.'},
                 { id: 'deactivation' },
                 { id: 'unlock' },
                 { id: 'invite' }
             ])
