.class public abstract Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;
.super Ljava/lang/Object;
.source "MAPServiceConnection.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/content/ServiceConnection;"
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field protected mListener:Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;

.field protected mService:Landroid/os/IInterface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    .local p0, "this":Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;, "Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->mService:Landroid/os/IInterface;

    .line 27
    return-void
.end method


# virtual methods
.method public abstract getServiceInterface(Landroid/os/IBinder;)Landroid/os/IInterface;
.end method

.method public abstract getServiceInterfaceClass()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end method

.method protected isValidService(Landroid/os/IBinder;)Z
    .locals 4
    .param p1, "service"    # Landroid/os/IBinder;

    .prologue
    .line 63
    .local p0, "this":Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;, "Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection<TT;>;"
    :try_start_0
    invoke-interface {p1}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->getServiceInterfaceClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 67
    :goto_0
    return v1

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 67
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 34
    .local p0, "this":Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;, "Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection<TT;>;"
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onServiceConnected called"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    invoke-virtual {p0, p2}, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->isValidService(Landroid/os/IBinder;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    invoke-virtual {p0, p2}, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->getServiceInterface(Landroid/os/IBinder;)Landroid/os/IInterface;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->mService:Landroid/os/IInterface;

    .line 38
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->mListener:Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;

    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->mService:Landroid/os/IInterface;

    invoke-interface {v0, v1}, Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;->onBindSuccess(Landroid/os/IInterface;)V

    .line 43
    :goto_0
    return-void

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->mListener:Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;

    new-instance v1, Lcom/amazon/identity/auth/device/AuthError;

    const-string v2, "Returned service\'s interface doesn\'t match authorization service"

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    invoke-interface {v0, v1}, Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;->onBindError(Lcom/amazon/identity/auth/device/AuthError;)V

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 57
    .local p0, "this":Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;, "Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection<TT;>;"
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onServiceDisconnected called"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->mService:Landroid/os/IInterface;

    .line 59
    return-void
.end method

.method public setServiceListener(Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;

    .prologue
    .line 46
    .local p0, "this":Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;, "Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection<TT;>;"
    if-nez p1, :cond_0

    .line 47
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "listener cannot be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_0
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/MAPServiceConnection;->mListener:Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;

    .line 50
    return-void
.end method
