from django.db import models

# Create your models here.
class gameDetails(models.Model):
    Steam_ID = models.PositiveIntegerField()
    Game_Title = models.CharField(max_length=255)
    Genre = models.CharField(max_length=255)
    Release_Date = models.CharField(max_length=255)
    Publisher = models.CharField(max_length=255)
    Price = models.CharField(max_length=255)
    Languages = models.TextField()
    Descriptions = models.TextField()
    Mature_Content_Descriptions = models.TextField(null=True)
    System_Requirements = models.TextField()
    Metric_Critic_Score = models.CharField(max_length=64, null=True)
    Metric_Critic_Score_Link = models.TextField(null=True)
    Links = models.TextField()
    def __str__(self):
        return self.Game_Title
    class Meta:
        db_table = 'Game Detail'
        verbose_name = 'Game Detail'