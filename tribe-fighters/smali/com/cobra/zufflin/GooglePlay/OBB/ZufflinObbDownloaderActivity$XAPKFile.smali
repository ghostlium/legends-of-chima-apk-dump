.class Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;
.super Ljava/lang/Object;
.source "ZufflinObbDownloaderActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "XAPKFile"
.end annotation


# instance fields
.field public final mFileCRC:J

.field public final mFileSize:J

.field public final mFileVersion:I

.field public final mIsMain:Z


# direct methods
.method constructor <init>(ZIJJ)V
    .locals 0
    .param p1, "isMain"    # Z
    .param p2, "fileVersion"    # I
    .param p3, "fileSize"    # J
    .param p5, "fileCRC"    # J

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput-boolean p1, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mIsMain:Z

    .line 106
    iput p2, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mFileVersion:I

    .line 107
    iput-wide p3, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mFileSize:J

    .line 108
    iput-wide p5, p0, Lcom/cobra/zufflin/GooglePlay/OBB/ZufflinObbDownloaderActivity$XAPKFile;->mFileCRC:J

    .line 109
    return-void
.end method
