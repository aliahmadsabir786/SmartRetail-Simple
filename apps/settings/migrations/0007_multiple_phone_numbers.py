from django.db import migrations, models


class Migration(migrations.Migration):
    """Store phone + distributor phone can now hold several numbers (comma-separated)."""

    dependencies = [
        ("settings", "0006_companysettings_account_prefix"),
    ]

    operations = [
        migrations.AlterField(
            model_name="companysettings",
            name="phone",
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name="companysettings",
            name="distributor_phone",
            field=models.CharField(blank=True, max_length=255),
        ),
    ]