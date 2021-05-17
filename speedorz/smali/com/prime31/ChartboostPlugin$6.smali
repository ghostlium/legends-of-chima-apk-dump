.class Lcom/prime31/ChartboostPlugin$6;
.super Ljava/lang/Object;
.source "ChartboostPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/ChartboostPlugin;->cacheInterstitial(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/ChartboostPlugin;

.field private final synthetic val$location:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/prime31/ChartboostPlugin;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/ChartboostPlugin$6;->this$0:Lcom/prime31/ChartboostPlugin;

    iput-object p2, p0, Lcom/prime31/ChartboostPlugin$6;->val$location:Ljava/lang/String;

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$6;->val$location:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$6;->val$location:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$6;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    iget-object v1, p0, Lcom/prime31/ChartboostPlugin$6;->val$location:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->cacheInterstitial(Ljava/lang/String;)V

    .line 115
    :goto_0
    return-void

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$6;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->cacheInterstitial()V

    goto :goto_0
.end method
