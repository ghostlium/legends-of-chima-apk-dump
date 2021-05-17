.class Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;
.super Ljava/lang/Object;
.source "ThirdPartyServiceHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HighestVersionedService"
.end annotation


# static fields
.field static mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

.field static serviceDiscoveryTimestamp:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 65
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    .line 66
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->serviceDiscoveryTimestamp:J

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMAPServiceInfo()Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    return-object v0
.end method

.method static isServiceCacheStale()Z
    .locals 7

    .prologue
    const/4 v2, 0x1

    .line 83
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    if-nez v3, :cond_1

    .line 90
    .local v0, "now":J
    :cond_0
    :goto_0
    return v2

    .line 86
    .end local v0    # "now":J
    :cond_1
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    .line 87
    .restart local v0    # "now":J
    sget-wide v3, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->serviceDiscoveryTimestamp:J

    const-wide/32 v5, 0x5265c00

    add-long/2addr v3, v5

    cmp-long v3, v0, v3

    if-gtz v3, :cond_0

    .line 90
    const/4 v2, 0x0

    goto :goto_0
.end method

.method static setMAPServiceInfo(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;)V
    .locals 2
    .param p0, "serviceInfo"    # Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    .prologue
    .line 73
    sput-object p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    .line 74
    if-nez p0, :cond_0

    .line 75
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->serviceDiscoveryTimestamp:J

    .line 80
    :goto_0
    return-void

    .line 78
    :cond_0
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    sput-wide v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$HighestVersionedService;->serviceDiscoveryTimestamp:J

    goto :goto_0
.end method
