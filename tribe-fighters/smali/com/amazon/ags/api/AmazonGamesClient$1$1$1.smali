.class Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;
.super Ljava/lang/Object;
.source "AmazonGamesClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/api/AmazonGamesClient$1$1;->onInitialized()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;


# direct methods
.method constructor <init>(Lcom/amazon/ags/api/AmazonGamesClient$1$1;)V
    .locals 0

    .prologue
    .line 207
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 209
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v8, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getInstance()Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/AGSClientInstanceCoordinator;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v2, v2, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v2, v2, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v2}, Lcom/amazon/ags/api/AmazonGamesClient;->access$000(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/content/ContentManager;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v3, v3, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v3, v3, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v3}, Lcom/amazon/ags/api/AmazonGamesClient;->access$400(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/client/metrics/EventCollectorClient;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v4, v4, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v4, v4, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$stringObfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    iget-object v5, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v5, v5, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v5, v5, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v5}, Lcom/amazon/ags/api/AmazonGamesClient;->access$200(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/content/GCVariationManager;

    move-result-object v5

    iget-object v6, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v6, v6, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v6, v6, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v6}, Lcom/amazon/ags/api/AmazonGamesClient;->access$500(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/util/GlobalState;

    move-result-object v6

    invoke-static/range {v0 .. v6}, Lcom/amazon/ags/html5/factory/ServiceFactory;->initialize(Landroid/content/Context;Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManager;Lcom/amazon/ags/client/metrics/EventCollectorClient;Lcom/amazon/ags/storage/StringObfuscator;Lcom/amazon/ags/html5/content/GCVariationManager;Lcom/amazon/ags/html5/util/GlobalState;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v0

    invoke-static {v8, v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$302(Lcom/amazon/ags/api/AmazonGamesClient;Lcom/amazon/ags/html5/factory/ServiceFactory;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    .line 210
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$300(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/factory/ServiceFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/ags/html5/factory/ServiceFactory;->getKindleFireProxy()Lcom/amazon/ags/client/KindleFireProxy;

    move-result-object v7

    .line 211
    .local v7, "kindleFireProxy":Lcom/amazon/ags/client/KindleFireProxy;
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-interface {v7}, Lcom/amazon/ags/client/KindleFireProxy;->isKindle()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$600(Lcom/amazon/ags/api/AmazonGamesClient;Z)V

    .line 212
    new-instance v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;

    invoke-direct {v0, p0}, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;-><init>(Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;)V

    invoke-interface {v7, v0}, Lcom/amazon/ags/client/KindleFireProxy;->bindToGameCircleService(Lcom/amazon/ags/client/KindleFireBindingCallback;)V

    .line 223
    return-void
.end method
