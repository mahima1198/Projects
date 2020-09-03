# Generated by Django 3.0.6 on 2020-08-16 17:07

from django.db import migrations, models
import myapp.models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0002_auto_20200716_1133'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='hours',
            field=models.DecimalField(decimal_places=2, default=1, max_digits=10),
        ),
        migrations.AddField(
            model_name='student',
            name='image',
            field=models.ImageField(null=True, upload_to='profile'),
        ),
        migrations.AlterField(
            model_name='course',
            name='price',
            field=models.DecimalField(decimal_places=2, max_digits=10, validators=[myapp.models.limit]),
        ),
    ]
