from django.core.management import call_command

output= open('initial.json', 'w') #our file_name is intial.json
call_command('dumpdata', 'myapp', format='json', indent=3, stdout=output)
output.close()