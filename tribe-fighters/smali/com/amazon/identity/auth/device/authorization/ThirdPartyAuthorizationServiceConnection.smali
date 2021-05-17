.class public Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;
.super Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;
.source "ThirdPartyAuthorizationServiceConnection.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection",
        "<",
        "Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;",
        ">;"
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-class v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;-><init>()V

    .line 14
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;->LOG_TAG:Ljava/lang/String;

    const-string v1, "ThirdPartyAuthorizationServiceInterface created"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    return-void
.end method


# virtual methods
.method public getServiceInterface(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 1
    .param p1, "service"    # Landroid/os/IBinder;

    .prologue
    .line 25
    invoke-static {p1}, Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface$Stub;->asInterface(Landroid/os/IBinder;)Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;

    move-result-object v0

    return-object v0
.end method

.method public getServiceInterfaceClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<",
            "Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19
    const-class v0, Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;

    return-object v0
.end method
