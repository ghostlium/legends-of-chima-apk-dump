.class public Lcom/cobra/zufflin/OBBFileInfo;
.super Ljava/lang/Object;
.source "OBBFileInfo.java"


# instance fields
.field private fileCRC:J

.field private fileLength:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 2
    .param p1, "fileLength"    # J
    .param p3, "fileCRC"    # J

    .prologue
    const-wide/16 v0, 0x0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput-wide v0, p0, Lcom/cobra/zufflin/OBBFileInfo;->fileLength:J

    .line 7
    iput-wide v0, p0, Lcom/cobra/zufflin/OBBFileInfo;->fileCRC:J

    .line 11
    iput-wide p1, p0, Lcom/cobra/zufflin/OBBFileInfo;->fileLength:J

    .line 12
    iput-wide p3, p0, Lcom/cobra/zufflin/OBBFileInfo;->fileCRC:J

    .line 13
    return-void
.end method


# virtual methods
.method public getCRC()J
    .locals 2

    .prologue
    .line 21
    iget-wide v0, p0, Lcom/cobra/zufflin/OBBFileInfo;->fileCRC:J

    return-wide v0
.end method

.method public getFileLength()J
    .locals 2

    .prologue
    .line 16
    iget-wide v0, p0, Lcom/cobra/zufflin/OBBFileInfo;->fileLength:J

    return-wide v0
.end method
