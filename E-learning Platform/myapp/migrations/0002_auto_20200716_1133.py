# Generated by Django 3.0.6 on 2020-07-16 15:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='interested',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='course',
            name='stages',
            field=models.PositiveIntegerField(default=3),
        ),
    ]
