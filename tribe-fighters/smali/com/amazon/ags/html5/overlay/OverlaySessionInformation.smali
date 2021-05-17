.class public Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;
.super Ljava/lang/Object;
.source "OverlaySessionInformation.java"


# instance fields
.field final applicationName:Ljava/lang/String;

.field final clientVersion:Ljava/lang/String;

.field final contentVersion:Ljava/lang/String;

.field final deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

.field final localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/amazon/ags/html5/util/LocalizationUtil;Lcom/amazon/ags/html5/util/DeviceInfo;)V
    .locals 0
    .param p1, "clientVersion"    # Ljava/lang/String;
    .param p2, "contentVersion"    # Ljava/lang/String;
    .param p3, "applicationName"    # Ljava/lang/String;
    .param p4, "localizationUtil"    # Lcom/amazon/ags/html5/util/LocalizationUtil;
    .param p5, "deviceInfo"    # Lcom/amazon/ags/html5/util/DeviceInfo;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->clientVersion:Ljava/lang/String;

    .line 20
    iput-object p2, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->contentVersion:Ljava/lang/String;

    .line 21
    iput-object p3, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->applicationName:Ljava/lang/String;

    .line 22
    iput-object p4, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

    .line 23
    iput-object p5, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

    .line 24
    return-void
.end method


# virtual methods
.method public getApplicationName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->applicationName:Ljava/lang/String;

    return-object v0
.end method

.method public getClientVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->clientVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getContentVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->contentVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceInfo()Lcom/amazon/ags/html5/util/DeviceInfo;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->deviceInfo:Lcom/amazon/ags/html5/util/DeviceInfo;

    return-object v0
.end method

.method public getLocalizationUtil()Lcom/amazon/ags/html5/util/LocalizationUtil;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/amazon/ags/html5/overlay/OverlaySessionInformation;->localizationUtil:Lcom/amazon/ags/html5/util/LocalizationUtil;

    return-object v0
.end method
