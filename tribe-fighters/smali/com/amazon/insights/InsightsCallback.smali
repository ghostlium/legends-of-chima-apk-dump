.class public abstract Lcom/amazon/insights/InsightsCallback;
.super Ljava/lang/Object;
.source "InsightsCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/amazon/insights/core/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/amazon/insights/InsightsCallback;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/InsightsCallback;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 19
    .local p0, "this":Lcom/amazon/insights/InsightsCallback;, "Lcom/amazon/insights/InsightsCallback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method


# virtual methods
.method public abstract onComplete(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public onError(Lcom/amazon/insights/error/InsightsError;)V
    .locals 2
    .param p1, "error"    # Lcom/amazon/insights/error/InsightsError;

    .prologue
    .line 38
    .local p0, "this":Lcom/amazon/insights/InsightsCallback;, "Lcom/amazon/insights/InsightsCallback<TT;>;"
    sget-object v0, Lcom/amazon/insights/InsightsCallback;->logger:Lcom/amazon/insights/core/log/Logger;

    invoke-interface {p1}, Lcom/amazon/insights/error/InsightsError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->deve(Ljava/lang/String;)V

    .line 39
    return-void
.end method
