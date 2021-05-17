.class public Lcom/amazon/ags/client/whispersync/migration/DownloadResult;
.super Ljava/lang/Object;
.source "DownloadResult.java"


# instance fields
.field private final gameData:[B

.field private final resultCode:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;


# direct methods
.method public constructor <init>([BLcom/amazon/ags/api/whispersync/migration/MigrationResultCode;)V
    .locals 0
    .param p1, "gameData"    # [B
    .param p2, "resultCode"    # Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;->gameData:[B

    .line 17
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;->resultCode:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    .line 18
    return-void
.end method


# virtual methods
.method public getGameData()[B
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;->gameData:[B

    return-object v0
.end method

.method public getResultCode()Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/migration/DownloadResult;->resultCode:Lcom/amazon/ags/api/whispersync/migration/MigrationResultCode;

    return-object v0
.end method
