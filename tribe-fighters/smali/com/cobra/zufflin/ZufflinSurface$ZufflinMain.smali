.class Lcom/cobra/zufflin/ZufflinSurface$ZufflinMain;
.super Ljava/lang/Object;
.source "ZufflinSurface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cobra/zufflin/ZufflinSurface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ZufflinMain"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/ZufflinSurface;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/ZufflinSurface;)V
    .locals 0

    .prologue
    .line 226
    iput-object p1, p0, Lcom/cobra/zufflin/ZufflinSurface$ZufflinMain;->this$0:Lcom/cobra/zufflin/ZufflinSurface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 231
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->initialiseNativeEngine()V

    .line 232
    invoke-static {}, Lcom/cobra/zufflin/ZufflinNative;->mainLoop()V

    .line 233
    return-void
.end method
