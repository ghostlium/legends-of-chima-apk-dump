.class Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector$1;
.super Lcom/amazon/insights/InsightsCallback;
.source "AmazonInsightsEventCollector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;->initialize(Landroid/content/Context;)Lcom/amazon/insights/EventClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/insights/InsightsCallback",
        "<",
        "Lcom/amazon/insights/AmazonInsights;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector$1;->this$0:Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;

    iput-object p2, p0, Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Lcom/amazon/insights/InsightsCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/amazon/insights/AmazonInsights;)V
    .locals 6
    .param p1, "instance"    # Lcom/amazon/insights/AmazonInsights;

    .prologue
    .line 68
    :try_start_0
    invoke-virtual {p1}, Lcom/amazon/insights/AmazonInsights;->getEventClient()Lcom/amazon/insights/EventClient;

    move-result-object v2

    .line 69
    .local v2, "eventClient":Lcom/amazon/insights/EventClient;
    sget-object v4, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->DEVICE_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v4}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/amazon/ags/html5/util/DeviceInfo;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/amazon/insights/EventClient;->addGlobalAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    iget-object v4, p0, Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector$1;->val$context:Landroid/content/Context;

    const/4 v5, 0x0

    invoke-direct {v0, v4, v5}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 71
    .local v0, "authorizationManager":Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->getAppId()Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "gameId":Ljava/lang/String;
    sget-object v4, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->GAME_ID:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;

    invoke-virtual {v4}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricDecoratedValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4, v3}, Lcom/amazon/insights/EventClient;->addGlobalAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .end local v0    # "authorizationManager":Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;
    .end local v2    # "eventClient":Lcom/amazon/insights/EventClient;
    .end local v3    # "gameId":Ljava/lang/String;
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v1

    .line 74
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Unexpected error occurred while attempting to add GameID and DeviceID to Insights instance"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public bridge synthetic onComplete(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 64
    check-cast p1, Lcom/amazon/insights/AmazonInsights;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/metrics/AmazonInsightsEventCollector$1;->onComplete(Lcom/amazon/insights/AmazonInsights;)V

    return-void
.end method
