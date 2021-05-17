.class public Lcom/amazon/ags/client/whispersync/storage/GameData;
.super Ljava/lang/Object;
.source "GameData.java"


# instance fields
.field private gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

.field private versionId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Ljava/lang/String;)V
    .locals 0
    .param p1, "gameDataMap"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .param p2, "versionId"    # Ljava/lang/String;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/storage/GameData;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    .line 17
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/storage/GameData;->versionId:Ljava/lang/String;

    .line 18
    return-void
.end method


# virtual methods
.method public getGameDataMap()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/storage/GameData;->gameDataMap:Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    return-object v0
.end method

.method public getVersionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/storage/GameData;->versionId:Ljava/lang/String;

    return-object v0
.end method
