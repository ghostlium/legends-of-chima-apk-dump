.class public Lcom/amazon/ags/storage/OfflineEvent;
.super Ljava/lang/Object;
.source "OfflineEvent.java"


# static fields
.field public static final KEY_EVENT_TIME:Ljava/lang/String; = "eventTime"


# instance fields
.field private final eventJson:Lorg/json/JSONObject;

.field private final eventTime:Ljava/util/Date;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-string v2, "eventTime"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 31
    .local v0, "time":J
    iput-object p1, p0, Lcom/amazon/ags/storage/OfflineEvent;->eventJson:Lorg/json/JSONObject;

    .line 32
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    iput-object v2, p0, Lcom/amazon/ags/storage/OfflineEvent;->eventTime:Ljava/util/Date;

    .line 33
    return-void
.end method


# virtual methods
.method public getEventTime()Ljava/util/Date;
    .locals 3

    .prologue
    .line 41
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lcom/amazon/ags/storage/OfflineEvent;->eventTime:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public toJson()Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineEvent;->eventJson:Lorg/json/JSONObject;

    return-object v0
.end method
