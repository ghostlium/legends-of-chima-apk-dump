.class public Lcom/playhaven/android/DeviceId;
.super Ljava/lang/Object;
.source "DeviceId.java"


# static fields
.field private static final MAGIC_DEVICE_ID:Ljava/lang/String; = "9774d56d682e549c"


# instance fields
.field private deviceId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/DeviceId;->deviceId:Ljava/lang/String;

    .line 44
    iget-object v0, p0, Lcom/playhaven/android/DeviceId;->deviceId:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/playhaven/android/DeviceId;->isValidDeviceId(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 50
    :cond_0
    :goto_0
    return-void

    .line 46
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/DeviceId;->deviceId:Ljava/lang/String;

    .line 47
    iget-object v0, p0, Lcom/playhaven/android/DeviceId;->deviceId:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/playhaven/android/DeviceId;->isValidDeviceId(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 49
    const-string v0, "9774d56d682e549c"

    iput-object v0, p0, Lcom/playhaven/android/DeviceId;->deviceId:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method protected isValidDeviceId(Ljava/lang/String;)Z
    .locals 2
    .param p1, "devId"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 62
    if-nez p1, :cond_1

    .line 66
    :cond_0
    :goto_0
    return v0

    .line 63
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    const-string v1, "9774d56d682e549c"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 66
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/playhaven/android/DeviceId;->deviceId:Ljava/lang/String;

    return-object v0
.end method
