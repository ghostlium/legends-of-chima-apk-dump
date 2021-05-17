.class public Lcom/amazon/ags/html5/comm/UserAgentIdentifier;
.super Ljava/lang/Object;
.source "UserAgentIdentifier.java"


# static fields
.field private static final GAMECIRCLE_ANDROID_PRODUCT_TOKEN:Ljava/lang/String; = "gamecircle-android"

.field private static final GAMECIRCLE_JS_PRODUCT_TOKEN:Ljava/lang/String; = "gamecircle-js"

.field private static final RFC2616_PRODUCT_TOKEN_AND_VERSION_SEPARATOR:Ljava/lang/String; = "/"

.field private static final RFC2616_PRODUCT_TOKEN_SEPARATOR:Ljava/lang/String; = " "


# instance fields
.field private final contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

.field private final versionInfo:Lcom/amazon/ags/VersionInfo;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/VersionInfo;Lcom/amazon/ags/html5/content/ContentVersion;)V
    .locals 0
    .param p1, "versionInfo"    # Lcom/amazon/ags/VersionInfo;
    .param p2, "contentVersion"    # Lcom/amazon/ags/html5/content/ContentVersion;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/amazon/ags/html5/comm/UserAgentIdentifier;->versionInfo:Lcom/amazon/ags/VersionInfo;

    .line 27
    iput-object p2, p0, Lcom/amazon/ags/html5/comm/UserAgentIdentifier;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    .line 28
    return-void
.end method


# virtual methods
.method public getUserAgent()Ljava/lang/String;
    .locals 2

    .prologue
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "gamecircle-android"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    iget-object v1, p0, Lcom/amazon/ags/html5/comm/UserAgentIdentifier;->versionInfo:Lcom/amazon/ags/VersionInfo;

    invoke-virtual {v1}, Lcom/amazon/ags/VersionInfo;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    iget-object v1, p0, Lcom/amazon/ags/html5/comm/UserAgentIdentifier;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    if-eqz v1, :cond_0

    .line 38
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    const-string v1, "gamecircle-js"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    iget-object v1, p0, Lcom/amazon/ags/html5/comm/UserAgentIdentifier;->contentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/content/ContentVersion;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/amazon/ags/html5/comm/UserAgentIdentifier;->getUserAgent()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
