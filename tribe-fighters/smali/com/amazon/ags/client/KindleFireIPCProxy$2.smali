.class Lcom/amazon/ags/client/KindleFireIPCProxy$2;
.super Ljava/lang/Object;
.source "KindleFireIPCProxy.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/KindleFireIPCProxy;->bindToSynchronousService(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/KindleFireIPCProxy;)V
    .locals 0

    .prologue
    .line 295
    iput-object p1, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$2;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 299
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$2;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    invoke-static {v0, p2}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$202(Lcom/amazon/ags/client/KindleFireIPCProxy;Landroid/os/IBinder;)Landroid/os/IBinder;

    .line 300
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$2;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    invoke-static {v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$100(Lcom/amazon/ags/client/KindleFireIPCProxy;)V

    .line 301
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "className"    # Landroid/content/ComponentName;

    .prologue
    .line 305
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$2;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$202(Lcom/amazon/ags/client/KindleFireIPCProxy;Landroid/os/IBinder;)Landroid/os/IBinder;

    .line 306
    iget-object v0, p0, Lcom/amazon/ags/client/KindleFireIPCProxy$2;->this$0:Lcom/amazon/ags/client/KindleFireIPCProxy;

    invoke-static {v0}, Lcom/amazon/ags/client/KindleFireIPCProxy;->access$100(Lcom/amazon/ags/client/KindleFireIPCProxy;)V

    .line 307
    return-void
.end method
