.class Lcom/cobra/zufflin/ZufflinSurface$1;
.super Ljava/lang/Object;
.source "ZufflinSurface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/ZufflinSurface;->surfaceChanged(Landroid/view/SurfaceHolder;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/ZufflinSurface;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/ZufflinSurface;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/ZufflinSurface$1;->this$0:Lcom/cobra/zufflin/ZufflinSurface;

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 195
    :try_start_0
    iget-object v0, p0, Lcom/cobra/zufflin/ZufflinSurface$1;->this$0:Lcom/cobra/zufflin/ZufflinSurface;

    invoke-static {v0}, Lcom/cobra/zufflin/ZufflinSurface;->access$0(Lcom/cobra/zufflin/ZufflinSurface;)Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->doNativeExit()V

    .line 205
    :goto_0
    return-void

    .line 197
    :catch_0
    move-exception v0

    .line 203
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cobra/zufflin/ZufflinActivity;->doNativeExit()V

    goto :goto_0

    .line 201
    :catchall_0
    move-exception v0

    .line 203
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cobra/zufflin/ZufflinActivity;->doNativeExit()V

    .line 204
    throw v0
.end method
