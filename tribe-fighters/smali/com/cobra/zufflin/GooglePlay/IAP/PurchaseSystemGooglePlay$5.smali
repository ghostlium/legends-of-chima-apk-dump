.class Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;
.super Ljava/lang/Object;
.source "PurchaseSystemGooglePlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->execOnPurchaseComplete(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

.field private final synthetic val$apiCode:Ljava/lang/String;

.field private final synthetic val$bSuccessful:Z


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    iput-object p2, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;->val$apiCode:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;->val$bSuccessful:Z

    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 210
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;->val$apiCode:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;->val$bSuccessful:Z

    invoke-virtual {v0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->onPurchaseComplete(Ljava/lang/String;Z)V

    .line 211
    return-void
.end method
