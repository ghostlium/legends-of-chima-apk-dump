.class Lcom/amazon/ags/html5/content/GCVariationManager$1$1;
.super Lcom/amazon/insights/InsightsCallback;
.source "GCVariationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/content/GCVariationManager$1;->onComplete(Lcom/amazon/insights/VariationSet;)V
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
.field final synthetic this$1:Lcom/amazon/ags/html5/content/GCVariationManager$1;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/content/GCVariationManager$1;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1$1;->this$1:Lcom/amazon/ags/html5/content/GCVariationManager$1;

    invoke-direct {p0}, Lcom/amazon/insights/InsightsCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/amazon/insights/VariationSet;)V
    .locals 6
    .param p1, "vars"    # Lcom/amazon/insights/VariationSet;

    .prologue
    .line 74
    if-eqz p1, :cond_1

    .line 75
    invoke-interface {p1}, Lcom/amazon/insights/VariationSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazon/insights/Variation;

    .line 76
    .local v3, "var":Lcom/amazon/insights/Variation;
    invoke-interface {v3}, Lcom/amazon/insights/Variation;->getProjectName()Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "experimentName":Ljava/lang/String;
    const-string v4, "treatment"

    const-string v5, "GCNoVariableFound"

    invoke-interface {v3, v4, v5}, Lcom/amazon/insights/Variation;->getVariableAsString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 78
    .local v1, "experimentTreatment":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "GCNoVariableFound"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 79
    iget-object v4, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1$1;->this$1:Lcom/amazon/ags/html5/content/GCVariationManager$1;

    iget-object v4, v4, Lcom/amazon/ags/html5/content/GCVariationManager$1;->this$0:Lcom/amazon/ags/html5/content/GCVariationManager;

    invoke-static {v4}, Lcom/amazon/ags/html5/content/GCVariationManager;->access$200(Lcom/amazon/ags/html5/content/GCVariationManager;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 83
    .end local v0    # "experimentName":Ljava/lang/String;
    .end local v1    # "experimentTreatment":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "var":Lcom/amazon/insights/Variation;
    :cond_1
    iget-object v4, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1$1;->this$1:Lcom/amazon/ags/html5/content/GCVariationManager$1;

    iget-object v4, v4, Lcom/amazon/ags/html5/content/GCVariationManager$1;->val$callback:Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;

    if-eqz v4, :cond_2

    .line 84
    iget-object v4, p0, Lcom/amazon/ags/html5/content/GCVariationManager$1$1;->this$1:Lcom/amazon/ags/html5/content/GCVariationManager$1;

    iget-object v4, v4, Lcom/amazon/ags/html5/content/GCVariationManager$1;->val$callback:Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;

    invoke-interface {v4}, Lcom/amazon/ags/html5/content/GCVariationManager$GCVariationManagerRefreshCallback;->onRefreshCompleted()V

    .line 86
    :cond_2
    return-void
.end method

.method public bridge synthetic onComplete(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 71
    check-cast p1, Lcom/amazon/insights/VariationSet;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/html5/content/GCVariationManager$1$1;->onComplete(Lcom/amazon/insights/VariationSet;)V

    return-void
.end method
