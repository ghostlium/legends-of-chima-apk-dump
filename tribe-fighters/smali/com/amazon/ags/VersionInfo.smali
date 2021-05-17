.class public Lcom/amazon/ags/VersionInfo;
.super Ljava/lang/Object;
.source "VersionInfo.java"


# static fields
.field private static final SDK_MAJOR_VERSION:I = 0x2

.field private static final SDK_MINOR_VERSION:I = 0x3

.field private static final SDK_PATCH_VERSION:I = 0x0

.field private static final SDK_VERSION_QUALIFIER:Ljava/lang/String;

.field private static final SEPARATOR:Ljava/lang/String; = "."


# instance fields
.field private majorVersion:I

.field private minorVersion:I

.field private patchVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/ags/VersionInfo;->SDK_VERSION_QUALIFIER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "patch"    # I

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput p1, p0, Lcom/amazon/ags/VersionInfo;->majorVersion:I

    .line 30
    iput p2, p0, Lcom/amazon/ags/VersionInfo;->minorVersion:I

    .line 31
    iput p3, p0, Lcom/amazon/ags/VersionInfo;->patchVersion:I

    .line 32
    return-void
.end method

.method public static getSDKVersion()Lcom/amazon/ags/VersionInfo;
    .locals 4

    .prologue
    .line 25
    new-instance v0, Lcom/amazon/ags/VersionInfo;

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/VersionInfo;-><init>(III)V

    return-object v0
.end method


# virtual methods
.method public getMajorVersion()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/amazon/ags/VersionInfo;->majorVersion:I

    return v0
.end method

.method public getMinorVersion()I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lcom/amazon/ags/VersionInfo;->minorVersion:I

    return v0
.end method

.method public getPatchVersion()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/amazon/ags/VersionInfo;->patchVersion:I

    return v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 3

    .prologue
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/amazon/ags/VersionInfo;->majorVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/amazon/ags/VersionInfo;->minorVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/amazon/ags/VersionInfo;->patchVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "version":Ljava/lang/String;
    sget-object v1, Lcom/amazon/ags/VersionInfo;->SDK_VERSION_QUALIFIER:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/amazon/ags/VersionInfo;->SDK_VERSION_QUALIFIER:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 39
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/amazon/ags/VersionInfo;->getVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
