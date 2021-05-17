.class Lcom/prime31/ChartboostPlugin$10;
.super Ljava/lang/Object;
.source "ChartboostPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/ChartboostPlugin;->trackEvent(Ljava/lang/String;DLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/ChartboostPlugin;

.field private final synthetic val$eventIdentifier:Ljava/lang/String;

.field private final synthetic val$meta:Ljava/util/HashMap;

.field private final synthetic val$value:D


# direct methods
.method constructor <init>(Lcom/prime31/ChartboostPlugin;Ljava/lang/String;DLjava/util/HashMap;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/ChartboostPlugin$10;->this$0:Lcom/prime31/ChartboostPlugin;

    iput-object p2, p0, Lcom/prime31/ChartboostPlugin$10;->val$eventIdentifier:Ljava/lang/String;

    iput-wide p3, p0, Lcom/prime31/ChartboostPlugin$10;->val$value:D

    iput-object p5, p0, Lcom/prime31/ChartboostPlugin$10;->val$meta:Ljava/util/HashMap;

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 199
    :try_start_0
    invoke-static {}, Lcom/chartboost/sdk/Analytics/CBAnalytics;->sharedAnalytics()Lcom/chartboost/sdk/Analytics/CBAnalytics;

    move-result-object v1

    iget-object v2, p0, Lcom/prime31/ChartboostPlugin$10;->val$eventIdentifier:Ljava/lang/String;

    iget-wide v3, p0, Lcom/prime31/ChartboostPlugin$10;->val$value:D

    iget-object v5, p0, Lcom/prime31/ChartboostPlugin$10;->val$meta:Ljava/util/HashMap;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/chartboost/sdk/Analytics/CBAnalytics;->trackEvent(Ljava/lang/String;DLjava/util/Map;)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    :goto_0
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Prime31"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "error tracking event: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
