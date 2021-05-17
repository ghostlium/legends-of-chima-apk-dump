.class Lcom/amazon/ags/html5/content/GCVariationManager$1;
.super Lcom/amazon/insights/InsightsCallback;
.source "GCVariationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/content/GCVariationManager;->refreshVariations(Landroid/content/Context;Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazon/insights/InsightsCallback",
        "<",
        "Lcom/amazon/insights/VariationSet;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/content/GCVariationManager;

.field final synthetic val$abClient:Lcom/amazon/insights/ABTestClient;

.field final synthetic val$callback:Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/content/GCVariationManager;Lcom/amazon/insights/ABTestClient;Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1;->this$0:Lcom/amazon/ags/html5/content/GCVariationManager;

    iput-object p2, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1;->val$abClient:Lcom/amazon/insights/ABTestClient;

    iput-object p3, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1;->val$callback:Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;

    invoke-direct {p0}, Lcom/amazon/insights/InsightsCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/amazon/insights/VariationSet;)V
    .locals 5
    .param p1, "variations"    # Lcom/amazon/insights/VariationSet;

    .prologue
    .line 67
    if-eqz p1, :cond_1

    .line 68
    iget-object v3, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1;->this$0:Lcom/amazon/ags/html5/content/GCVariationManager;

    invoke-static {v3}, Lcom/amazon/ags/html5/content/GCVariationManager;->access$000(Lcom/amazon/ags/html5/content/GCVariationManager;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Lcom/amazon/insights/VariationSet;->getVariation(Ljava/lang/String;)Lcom/amazon/insights/Variation;

    move-result-object v0

    .line 69
    .local v0, "variation":Lcom/amazon/insights/Variation;
    iget-object v3, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1;->this$0:Lcom/amazon/ags/html5/content/GCVariationManager;

    invoke-static {v3}, Lcom/amazon/ags/html5/content/GCVariationManager;->access$100(Lcom/amazon/ags/html5/content/GCVariationManager;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v0, v3, v4}, Lcom/amazon/insights/Variation;->getVariableAsString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 70
    .local v2, "variationListVariableValue":Ljava/lang/String;
    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 71
    .local v1, "variationListVariableNames":[Ljava/lang/String;
    iget-object v3, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1;->val$abClient:Lcom/amazon/insights/ABTestClient;

    invoke-interface {v3, v1}, Lcom/amazon/insights/ABTestClient;->getVariations([Ljava/lang/String;)Lcom/amazon/insights/InsightsHandler;

    move-result-object v3

    new-instance v4, Lcom/amazon/ags/html5/content/GCVariationManager$1$1;

    invoke-direct {v4, p0}, Lcom/amazon/ags/html5/content/GCVariationManager$1$1;-><init>(Lcom/amazon/ags/html5/content/GCVariationManager$1;)V

    invoke-interface {v3, v4}, Lcom/amazon/insights/InsightsHandler;->setCallback(Lcom/amazon/insights/InsightsCallback;)V

    .line 93
    .end local v0    # "variation":Lcom/amazon/insights/Variation;
    .end local v1    # "variationListVariableNames":[Ljava/lang/String;
    .end local v2    # "variationListVariableValue":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 89
    :cond_1
    iget-object v3, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1;->val$callback:Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;

    if-eqz v3, :cond_0

    .line 90
    iget-object v3, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1;->val$callback:Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;

    invoke-interface {v3}, Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;->onRefreshCompleted()V

    goto :goto_0
.end method

.method public bridge synthetic onComplete(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 64
    check-cast p1, Lcom/amazon/insights/VariationSet;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/html5/content/GCVariationManager$1;->onComplete(Lcom/amazon/insights/VariationSet;)V

    return-void
.end method
