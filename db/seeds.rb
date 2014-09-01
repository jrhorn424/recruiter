%w[Fairfax Krasnow].each do |f|
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
