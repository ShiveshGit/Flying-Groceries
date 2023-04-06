from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager


# Create your models here.
class UserAccounts(AbstractUser):
    class Role(models.TextChoices):
        ADMIN = "ADMIN", "Admin"
        TRANSPORTER = "TRANSPORTER", "Transporter"
        CUSTOMER = "CUSTOMER", "Customer"

    base_role = Role.ADMIN
    role = models.CharField(max_length=50, choices=Role.choices)

    def save(self, *args, **kwargs):
        if not self.pk:
            self.role = self.base_role
            return super().save(*args, **kwargs)


class TransporterManager(BaseUserManager):
    def get_queryset(self, *args, **kwargs):
        results = super().get_queryset(*args, **kwargs)
        return results.filter(role=UserAccounts.Role.TRANSPORTER)


class Transporter(UserAccounts):
    base_role = UserAccounts.Role.TRANSPORTER
    Transporter = TransporterManager()

    class Meta:
        proxy = True

    def welcome(self):
        return "Only for Transporters"


class CustomerManager(BaseUserManager):
    def get_queryset(self, *args, **kwargs):
        results = super().get_queryset(*args, **kwargs)
        return results.filter(role=UserAccounts.Role.CUSTOMER)


class Customer(UserAccounts):
    base_role = UserAccounts.Role.CUSTOMER
    Customer = CustomerManager()

    class Meta:
        proxy = True

    def welcome(self):
        return "Only for Customers"
    

class Manager(BaseUserManager):
    def get_queryset(self, *args, **kwargs):
        results = super().get_queryset(*args, **kwargs)
        return results.filter(role=UserAccounts.Role.TRANSPORTER)


class Transporter(UserAccounts):
    base_role = UserAccounts.Role.TRANSPORTER
    Transporter = TransporterManager()

    class Meta:
        proxy = True

    def welcome(self):
        return "Only for Admins"