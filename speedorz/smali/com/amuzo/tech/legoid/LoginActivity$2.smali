.class Lcom/amuzo/tech/legoid/LoginActivity$2;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amuzo/tech/legoid/LoginActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amuzo/tech/legoid/LoginActivity;


# direct methods
.method constructor <init>(Lcom/amuzo/tech/legoid/LoginActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LoginActivity$2;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 178
    const-string v0, "4t2"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Loading URL from Login Activity: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/amuzo/tech/legoid/LoginActivity$2;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v2}, Lcom/amuzo/tech/legoid/LoginActivity;->access$6(Lcom/amuzo/tech/legoid/LoginActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity$2;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v0}, Lcom/amuzo/tech/legoid/LoginActivity;->access$5(Lcom/amuzo/tech/legoid/LoginActivity;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/amuzo/tech/legoid/LoginActivity$2;->this$0:Lcom/amuzo/tech/legoid/LoginActivity;

    invoke-static {v1}, Lcom/amuzo/tech/legoid/LoginActivity;->access$6(Lcom/amuzo/tech/legoid/LoginActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 181
    return-void
.end method
