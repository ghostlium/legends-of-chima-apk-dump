.class public Lcom/amazon/insights/core/system/AndroidSystem;
.super Ljava/lang/Object;
.source "AndroidSystem.java"

# interfaces
.implements Lcom/amazon/insights/core/system/System;


# instance fields
.field private final appDetails:Lcom/amazon/insights/core/system/AppDetails;

.field private final connectivity:Lcom/amazon/insights/core/system/Connectivity;

.field private final deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

.field private final fileManager:Lcom/amazon/insights/core/system/FileManager;

.field private final preferences:Lcom/amazon/insights/core/system/Preferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/amazon/insights/InsightsCredentials;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "credentials"    # Lcom/amazon/insights/InsightsCredentials;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/amazon/insights/core/system/AndroidPreferences;

    invoke-direct {v0, p1, p2}, Lcom/amazon/insights/core/system/AndroidPreferences;-><init>(Landroid/content/Context;Lcom/amazon/insights/InsightsCredentials;)V

    iput-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->preferences:Lcom/amazon/insights/core/system/Preferences;

    .line 20
    new-instance v0, Lcom/amazon/insights/core/system/DefaultFileManager;

    invoke-interface {p2}, Lcom/amazon/insights/InsightsCredentials;->getApplicationKey()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazon/insights/core/system/DefaultFileManager;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->fileManager:Lcom/amazon/insights/core/system/FileManager;

    .line 21
    new-instance v0, Lcom/amazon/insights/core/system/AndroidConnectivity;

    invoke-direct {v0, p1}, Lcom/amazon/insights/core/system/AndroidConnectivity;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    .line 22
    new-instance v0, Lcom/amazon/insights/core/system/AndroidAppDetails;

    invoke-direct {v0, p1}, Lcom/amazon/insights/core/system/AndroidAppDetails;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->appDetails:Lcom/amazon/insights/core/system/AppDetails;

    .line 23
    new-instance v0, Lcom/amazon/insights/core/system/AndroidDeviceDetails;

    invoke-direct {v0}, Lcom/amazon/insights/core/system/AndroidDeviceDetails;-><init>()V

    iput-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

    .line 24
    return-void
.end method


# virtual methods
.method public getAppDetails()Lcom/amazon/insights/core/system/AppDetails;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->appDetails:Lcom/amazon/insights/core/system/AppDetails;

    return-object v0
.end method

.method public getConnectivity()Lcom/amazon/insights/core/system/Connectivity;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    return-object v0
.end method

.method public getDeviceDetails()Lcom/amazon/insights/core/system/DeviceDetails;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->deviceDetails:Lcom/amazon/insights/core/system/DeviceDetails;

    return-object v0
.end method

.method public getFileManager()Lcom/amazon/insights/core/system/FileManager;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->fileManager:Lcom/amazon/insights/core/system/FileManager;

    return-object v0
.end method

.method public getPreferences()Lcom/amazon/insights/core/system/Preferences;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/amazon/insights/core/system/AndroidSystem;->preferences:Lcom/amazon/insights/core/system/Preferences;

    return-object v0
.end method
