.class Lcom/amazon/insights/delivery/DefaultDeliveryClient$4;
.super Ljava/lang/Object;
.source "DefaultDeliveryClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/insights/delivery/DefaultDeliveryClient;->batchedEvents()[Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

.field final synthetic val$eventsReadyLatch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lcom/amazon/insights/delivery/DefaultDeliveryClient;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .prologue
    .line 273
    iput-object p1, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$4;->this$0:Lcom/amazon/insights/delivery/DefaultDeliveryClient;

    iput-object p2, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$4;->val$eventsReadyLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 276
    iget-object v0, p0, Lcom/amazon/insights/delivery/DefaultDeliveryClient$4;->val$eventsReadyLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 277
    return-void
.end method
