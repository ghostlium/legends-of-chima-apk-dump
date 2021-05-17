.class Lcom/prime31/ChartboostPlugin$2;
.super Ljava/lang/Object;
.source "ChartboostPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/ChartboostPlugin;->onDestroy()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 44
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v1

    invoke-virtual {v1}, Lcom/prime31/ChartboostPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->onDestroy(Landroid/app/Activity;)V

    .line 45
    return-void
.end method
