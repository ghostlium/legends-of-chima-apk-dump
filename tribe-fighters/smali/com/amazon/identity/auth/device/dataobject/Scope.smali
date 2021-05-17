.class public Lcom/amazon/identity/auth/device/dataobject/Scope;
.super Ljava/lang/Object;
.source "Scope.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private scopeDescription:Ljava/lang/String;

.field private final scopeName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 5
    const-class v0, Lcom/amazon/identity/auth/device/dataobject/Scope;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/amazon/identity/auth/device/dataobject/Scope;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "scopeName"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeDescription:Ljava/lang/String;

    .line 14
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeName:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public static getDescription(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "scopeName"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/lang/String;

    .prologue
    .line 49
    return-object p0
.end method

.method public static isLocal(Ljava/lang/String;)Z
    .locals 1
    .param p0, "scopeName"    # Ljava/lang/String;

    .prologue
    .line 63
    sget-boolean v0, Lcom/amazon/identity/auth/device/dataobject/Scope;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 71
    :cond_0
    const-string v0, "device"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public declared-synchronized getScopeDescription()Ljava/lang/String;
    .locals 2

    .prologue
    .line 23
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeDescription:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 24
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeName:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/dataobject/Scope;->getDescription(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeDescription:Ljava/lang/String;

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeDescription:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 23
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getScopeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeName:Ljava/lang/String;

    return-object v0
.end method

.method public isLocal()Z
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeName:Ljava/lang/String;

    invoke-static {v0}, Lcom/amazon/identity/auth/device/dataobject/Scope;->isLocal(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setScopeDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "scopeDescription"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/Scope;->scopeDescription:Ljava/lang/String;

    return-void
.end method
