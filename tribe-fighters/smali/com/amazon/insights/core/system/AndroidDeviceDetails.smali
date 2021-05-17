.class public Lcom/amazon/insights/core/system/AndroidDeviceDetails;
.super Ljava/lang/Object;
.source "AndroidDeviceDetails.java"

# interfaces
.implements Lcom/amazon/insights/core/system/DeviceDetails;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public locale()Ljava/util/Locale;
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method public manufacturer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    return-object v0
.end method

.method public model()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public platform()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    const-string v0, "ANDROID"

    return-object v0
.end method

.method public platformVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method
