.class Lcom/prime31/ChartboostPlugin$5;
.super Ljava/lang/Object;
.source "ChartboostPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/ChartboostPlugin;->init(Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/ChartboostPlugin;

.field private final synthetic val$appId:Ljava/lang/String;

.field private final synthetic val$appSignature:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/prime31/ChartboostPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    iput-object p2, p0, Lcom/prime31/ChartboostPlugin$5;->val$appId:Ljava/lang/String;

    iput-object p3, p0, Lcom/prime31/ChartboostPlugin$5;->val$appSignature:Ljava/lang/String;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 92
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/prime31/ChartboostPlugin;->access$1(Lcom/prime31/ChartboostPlugin;Lcom/chartboost/sdk/Chartboost;)V

    .line 93
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    iget-object v1, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-virtual {v1}, Lcom/prime31/ChartboostPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/prime31/ChartboostPlugin$5;->val$appId:Ljava/lang/String;

    iget-object v3, p0, Lcom/prime31/ChartboostPlugin$5;->val$appSignature:Ljava/lang/String;

    iget-object v4, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/chartboost/sdk/Chartboost;->onCreate(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/chartboost/sdk/ChartboostDelegate;)V

    .line 94
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->setImpressionsUseActivities(Z)V

    .line 95
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->startSession()V

    .line 96
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    iget-object v1, p0, Lcom/prime31/ChartboostPlugin$5;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-virtual {v1}, Lcom/prime31/ChartboostPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->onStart(Landroid/app/Activity;)V

    .line 97
    return-void
.end method
