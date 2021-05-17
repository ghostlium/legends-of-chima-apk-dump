.class public Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;
.super Ljava/lang/Object;
.source "OfflineEventStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/storage/OfflineEventStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OfflineEventJSONTuple"
.end annotation


# instance fields
.field private final event:Lorg/json/JSONObject;

.field private final id:Lcom/amazon/ags/storage/OfflineEventId;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/storage/OfflineEventId;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "id"    # Lcom/amazon/ags/storage/OfflineEventId;
    .param p2, "event"    # Lorg/json/JSONObject;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p2, p0, Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;->event:Lorg/json/JSONObject;

    .line 27
    iput-object p1, p0, Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;->id:Lcom/amazon/ags/storage/OfflineEventId;

    .line 28
    return-void
.end method


# virtual methods
.method public getEventId()Lcom/amazon/ags/storage/OfflineEventId;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;->id:Lcom/amazon/ags/storage/OfflineEventId;

    return-object v0
.end method

.method public getJSONOfflineEvent()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineEventStorage$OfflineEventJSONTuple;->event:Lorg/json/JSONObject;

    return-object v0
.end method
