.class Lcom/prime31/ChartboostPlugin$3;
.super Ljava/lang/Object;
.source "ChartboostPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/ChartboostPlugin;->onStop()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 59
    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v0

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-static {}, Lcom/prime31/ChartboostPlugin;->instance()Lcom/prime31/ChartboostPlugin;

    move-result-object v1

    invoke-virtual {v1}, Lcom/prime31/ChartboostPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->onStop(Landroid/app/Activity;)V

    .line 60
    return-void
.end method
