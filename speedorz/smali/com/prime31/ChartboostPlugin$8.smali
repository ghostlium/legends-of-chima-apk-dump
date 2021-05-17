.class Lcom/prime31/ChartboostPlugin$8;
.super Ljava/lang/Object;
.source "ChartboostPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/ChartboostPlugin;->cacheMoreApps()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/ChartboostPlugin;


# direct methods
.method constructor <init>(Lcom/prime31/ChartboostPlugin;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/ChartboostPlugin$8;->this$0:Lcom/prime31/ChartboostPlugin;

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/prime31/ChartboostPlugin$8;->this$0:Lcom/prime31/ChartboostPlugin;

    invoke-static {v0}, Lcom/prime31/ChartboostPlugin;->access$0(Lcom/prime31/ChartboostPlugin;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->cacheMoreApps()V

    .line 160
    return-void
.end method
