from django.core.exceptions import ValidationError
from django.db import models
import datetime
from django.contrib.auth.models import User
from django.utils import timezone
from django.utils.safestring import mark_safe


class Topic(models.Model):
    name = models.CharField(max_length=200)
    category = models.CharField(max_length=200, blank=False, null=False, default=" ")

    def __str__(self):
        return self.name


def limit(value):
    if not 100 <= value <= 200:
        raise ValidationError(('Please enter value between 100 and 200 , %(value)  is not in the defined range '),
                              params={'value': value}, )


class Course(models.Model):
    topic = models.ForeignKey(Topic, related_name='courses', on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    price = models.DecimalField(max_digits=10, decimal_places=2, validators=[limit])
    hours = models.DecimalField(max_digits=10, decimal_places=2, default=1)
    for_everyone = models.BooleanField(default=True)
    description = models.TextField(max_length=300, null=True, blank=True)
    interested = models.PositiveIntegerField(default=0)
    stages = models.PositiveIntegerField(default=3)

    def __str__(self):
        return self.name

    def discount(self):
        return (float(self.price) * 0.9)


class Student(User):
    CITY_CHOICES = [('WS', 'Windsor'),
                    ('CG', 'Calgery'),
                    ('MR', 'Montreal'),
                    ('VC', 'Vancouver')]
    school = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=20, choices=CITY_CHOICES, default='Windsor')
    interested_in = models.ManyToManyField(Topic)
    profile_pic = models.ImageField(upload_to='profile', null=True, blank=True)

    def image_tag(self):
        if self.profile_pic:
            return mark_safe('<img src="%s" style="width: 200px; height:200px;" />' % self.profile_pic.url)
        else:
            return 'No Image Found'
    image_tag.short_description = 'Image'

    def __str__(self):
        return self.get_full_name()


class Order(models.Model):
    ORDER_STATUS_CHOICES = [(0, 'Cancelled'), (1, 'Order Confirmed')]
    course = models.ForeignKey(Course, related_name='course', on_delete=models.CASCADE)
    student = models.ForeignKey(Student, related_name='student', on_delete=models.CASCADE, max_length=200)
    levels = models.PositiveIntegerField()
    order_status = models.IntegerField(choices=ORDER_STATUS_CHOICES, default=1)
    order_date = models.DateField(default=datetime.date.today)
    total_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=False, editable=False,
                                      default=0)

    def __str__(self):
        return str(self.course)

    def total_cost(self):
        cname = Course.objects.get(name=self.course)
        total_price = self.total_price + cname.price
        return self.total_price
