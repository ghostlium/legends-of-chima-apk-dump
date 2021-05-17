.class Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$2;
.super Ljava/lang/Object;
.source "PurchaseSystemGooglePlay.java"

# interfaces
.implements Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnConsumeFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$2;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsumeFinished(Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;)V
    .locals 3
    .param p1, "purchase"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;
    .param p2, "result"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    .prologue
    .line 139
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$2;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-virtual {p1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;->isSuccess()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$7(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Ljava/lang/String;Z)V

    .line 140
    return-void
.end method
