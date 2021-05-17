.class Lcom/amazon/ags/html5/content/ContentManager$2;
.super Ljava/lang/Object;
.source "ContentManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/content/ContentManager;->fullContentInitialization(Ljava/util/concurrent/ExecutorService;Lcom/amazon/ags/html5/content/ContentManager$ContentInitializationCallback;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/content/ContentManager;

.field final synthetic val$manifestEndpoint:Ljava/lang/String;

.field final synthetic val$postUpgradeCurrentContentVersion:Lcom/amazon/ags/html5/content/ContentVersion;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/content/ContentManager;Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentVersion;)V
    .locals 0

    .prologue
    .line 238
    iput-object p1, p0, Lcom/amazon/ags/html5/content/ContentManager$2;->this$0:Lcom/amazon/ags/html5/content/ContentManager;

    iput-object p2, p0, Lcom/amazon/ags/html5/content/ContentManager$2;->val$manifestEndpoint:Ljava/lang/String;

    iput-object p3, p0, Lcom/amazon/ags/html5/content/ContentManager$2;->val$postUpgradeCurrentContentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v1, 0x1

    .line 240
    const/4 v9, 0x0

    .line 242
    .local v9, "shouldAttemptUpgrade":Z
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentManager$2;->this$0:Lcom/amazon/ags/html5/content/ContentManager;

    iget-object v2, p0, Lcom/amazon/ags/html5/content/ContentManager$2;->val$manifestEndpoint:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/amazon/ags/html5/content/ContentManager;->access$500(Lcom/amazon/ags/html5/content/ContentManager;ZLjava/lang/String;)Ljava/util/Map;

    move-result-object v7

    .line 244
    .local v7, "manifestEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/ags/html5/content/ContentManifestEntry;>;"
    invoke-static {}, Lcom/amazon/ags/VersionInfo;->getSDKVersion()Lcom/amazon/ags/VersionInfo;

    move-result-object v8

    .line 245
    .local v8, "sdkVersion":Lcom/amazon/ags/VersionInfo;
    invoke-virtual {v8}, Lcom/amazon/ags/VersionInfo;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/amazon/ags/html5/content/ContentManifestEntry;

    .line 246
    .local v10, "upgradeEntry":Lcom/amazon/ags/html5/content/ContentManifestEntry;
    if-eqz v10, :cond_0

    .line 248
    invoke-virtual {v10}, Lcom/amazon/ags/html5/content/ContentManifestEntry;->getVersion()Lcom/amazon/ags/html5/content/ContentVersion;

    move-result-object v0

    iget-object v2, p0, Lcom/amazon/ags/html5/content/ContentManager$2;->val$postUpgradeCurrentContentVersion:Lcom/amazon/ags/html5/content/ContentVersion;

    invoke-virtual {v0, v2}, Lcom/amazon/ags/html5/content/ContentVersion;->compareTo(Lcom/amazon/ags/html5/content/ContentVersion;)I

    move-result v0

    if-lez v0, :cond_0

    .line 250
    const/4 v9, 0x1

    .line 254
    :cond_0
    if-eqz v9, :cond_1

    if-eqz v10, :cond_1

    .line 255
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentManager$2;->this$0:Lcom/amazon/ags/html5/content/ContentManager;

    invoke-virtual {v10}, Lcom/amazon/ags/html5/content/ContentManifestEntry;->getContentURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/amazon/ags/html5/content/ContentManager;->access$600()J

    move-result-wide v3

    invoke-virtual {v10}, Lcom/amazon/ags/html5/content/ContentManifestEntry;->getChecksum()Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v0 .. v5}, Lcom/amazon/ags/html5/content/ContentManager;->access$700(Lcom/amazon/ags/html5/content/ContentManager;ZLjava/lang/String;JLjava/lang/String;)Z

    move-result v6

    .line 257
    .local v6, "contentDownloaded":Z
    if-eqz v6, :cond_1

    .line 258
    iget-object v0, p0, Lcom/amazon/ags/html5/content/ContentManager$2;->this$0:Lcom/amazon/ags/html5/content/ContentManager;

    invoke-static {v0}, Lcom/amazon/ags/html5/content/ContentManager;->access$800(Lcom/amazon/ags/html5/content/ContentManager;)Z

    .line 261
    .end local v6    # "contentDownloaded":Z
    :cond_1
    return-void
.end method
