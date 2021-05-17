.class Lcom/amazon/insights/abtest/DefaultABTestClient$1$1$1;
.super Ljava/lang/Object;
.source "DefaultABTestClient.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/insights/abtest/DefaultABTestClient$1$1;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lcom/amazon/insights/Variation;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/amazon/insights/abtest/DefaultABTestClient$1$1;

.field final synthetic val$iter:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lcom/amazon/insights/abtest/DefaultABTestClient$1$1;Ljava/util/Iterator;)V
    .locals 0

    .prologue
    .line 222
    iput-object p1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1$1;->this$2:Lcom/amazon/insights/abtest/DefaultABTestClient$1$1;

    iput-object p2, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1$1;->val$iter:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1$1;->val$iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Lcom/amazon/insights/Variation;
    .locals 3

    .prologue
    .line 230
    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1$1;->val$iter:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/Variation;

    .line 231
    .local v0, "variation":Lcom/amazon/insights/Variation;
    iget-object v1, p0, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1$1;->this$2:Lcom/amazon/insights/abtest/DefaultABTestClient$1$1;

    iget-object v1, v1, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1;->this$1:Lcom/amazon/insights/abtest/DefaultABTestClient$1;

    iget-object v2, v1, Lcom/amazon/insights/abtest/DefaultABTestClient$1;->this$0:Lcom/amazon/insights/abtest/DefaultABTestClient;

    move-object v1, v0

    check-cast v1, Lcom/amazon/insights/abtest/DefaultVariation;

    invoke-virtual {v2, v1}, Lcom/amazon/insights/abtest/DefaultABTestClient;->setVariationIdsFromAllocatedVariation(Lcom/amazon/insights/abtest/DefaultVariation;)V

    .line 232
    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 222
    invoke-virtual {p0}, Lcom/amazon/insights/abtest/DefaultABTestClient$1$1$1;->next()Lcom/amazon/insights/Variation;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 237
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This iterator does not support removal of variations"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
