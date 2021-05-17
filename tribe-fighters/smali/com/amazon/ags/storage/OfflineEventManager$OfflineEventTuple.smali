.class public Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;
.super Ljava/lang/Object;
.source "OfflineEventManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/ags/storage/OfflineEventManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OfflineEventTuple"
.end annotation


# instance fields
.field private final event:Lcom/amazon/ags/storage/OfflineEvent;

.field private final id:Lcom/amazon/ags/storage/OfflineEventId;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/storage/OfflineEventId;Lcom/amazon/ags/storage/OfflineEvent;)V
    .locals 0
    .param p1, "id"    # Lcom/amazon/ags/storage/OfflineEventId;
    .param p2, "event"    # Lcom/amazon/ags/storage/OfflineEvent;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p2, p0, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;->event:Lcom/amazon/ags/storage/OfflineEvent;

    .line 20
    iput-object p1, p0, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;->id:Lcom/amazon/ags/storage/OfflineEventId;

    .line 21
    return-void
.end method


# virtual methods
.method public getEventId()Lcom/amazon/ags/storage/OfflineEventId;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;->id:Lcom/amazon/ags/storage/OfflineEventId;

    return-object v0
.end method

.method public getOfflineEvent()Lcom/amazon/ags/storage/OfflineEvent;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineEventManager$OfflineEventTuple;->event:Lcom/amazon/ags/storage/OfflineEvent;

    return-object v0
.end method
