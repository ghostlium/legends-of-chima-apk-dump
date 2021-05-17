.class Lcom/prime31/GoogleIABPlugin$2;
.super Ljava/lang/Object;
.source "GoogleIABPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/GoogleIABPlugin;->queryInventory([Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/GoogleIABPlugin;

.field private final synthetic val$skus:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/prime31/GoogleIABPlugin;[Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/GoogleIABPlugin$2;->this$0:Lcom/prime31/GoogleIABPlugin;

    iput-object p2, p0, Lcom/prime31/GoogleIABPlugin$2;->val$skus:[Ljava/lang/String;

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 112
    iget-object v0, p0, Lcom/prime31/GoogleIABPlugin$2;->this$0:Lcom/prime31/GoogleIABPlugin;

    iget-object v0, v0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/prime31/GoogleIABPlugin$2;->val$skus:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/prime31/GoogleIABPlugin$2;->this$0:Lcom/prime31/GoogleIABPlugin;

    invoke-virtual {v0, v1, v2, v3}, Lcom/prime31/util/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;)V

    .line 113
    return-void
.end method
