.class Lcom/amazon/ags/api/AmazonGamesClient$1;
.super Ljava/lang/Object;
.source "AmazonGamesClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/api/AmazonGamesClient;->initialize_internal(Lcom/amazon/ags/api/AmazonGamesCallback;Landroid/app/Activity;ZLcom/amazon/ags/storage/StringObfuscator;Ljava/util/EnumSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/api/AmazonGamesClient;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$amazonGamesCallback:Lcom/amazon/ags/api/AmazonGamesCallback;

.field final synthetic val$appContext:Landroid/content/Context;

.field final synthetic val$reinitialize:Z

.field final synthetic val$stringObfuscator:Lcom/amazon/ags/storage/StringObfuscator;


# direct methods
.method constructor <init>(Lcom/amazon/ags/api/AmazonGamesClient;Landroid/content/Context;Landroid/app/Activity;Lcom/amazon/ags/storage/StringObfuscator;ZLcom/amazon/ags/api/AmazonGamesCallback;)V
    .locals 0

    .prologue
    .line 197
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    iput-object p2, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$appContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$activity:Landroid/app/Activity;

    iput-object p4, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$stringObfuscator:Lcom/amazon/ags/storage/StringObfuscator;

    iput-boolean p5, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$reinitialize:Z

    iput-object p6, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$amazonGamesCallback:Lcom/amazon/ags/api/AmazonGamesCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 199
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 201
    .local v0, "startTime":Ljava/util/Date;
    const-string v1, "GameCircleClient"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initialize_internal() executing on thread:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    new-instance v2, Lcom/amazon/ags/html5/content/ContentManager;

    iget-object v3, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$appContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/amazon/ags/html5/content/ContentManager;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lcom/amazon/ags/api/AmazonGamesClient;->access$002(Lcom/amazon/ags/api/AmazonGamesClient;Lcom/amazon/ags/html5/content/ContentManager;)Lcom/amazon/ags/html5/content/ContentManager;

    .line 204
    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->access$000(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/content/ContentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v2}, Lcom/amazon/ags/api/AmazonGamesClient;->access$100(Lcom/amazon/ags/api/AmazonGamesClient;)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v3}, Lcom/amazon/ags/api/AmazonGamesClient;->access$200(Lcom/amazon/ags/api/AmazonGamesClient;)Lcom/amazon/ags/html5/content/GCVariationManager;

    move-result-object v3

    new-instance v4, Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    invoke-direct {v4, p0, v0}, Lcom/amazon/ags/api/AmazonGamesClient$1$1;-><init>(Lcom/amazon/ags/api/AmazonGamesClient$1;Ljava/util/Date;)V

    invoke-virtual {v1, v2, v3, v4}, Lcom/amazon/ags/html5/content/ContentManager;->initializeContent(Ljava/util/concurrent/ExecutorService;Lcom/amazon/ags/html5/content/GCVariationManager;Lcom/amazon/ags/html5/content/ContentManager$ContentInitializationCallback;)V

    .line 238
    return-void
.end method
