.class Lcom/amazon/ags/client/whispersync/migration/MigrationManager$1;
.super Ljava/lang/Thread;
.source "MigrationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->downloadV1GameData(Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/client/whispersync/migration/MigrationManager;

.field final synthetic val$callback:Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;


# direct methods
.method constructor <init>(Lcom/amazon/ags/client/whispersync/migration/MigrationManager;Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager$1;->this$0:Lcom/amazon/ags/client/whispersync/migration/MigrationManager;

    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager$1;->val$callback:Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager$1;->this$0:Lcom/amazon/ags/client/whispersync/migration/MigrationManager;

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/migration/MigrationManager$1;->val$callback:Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;

    invoke-static {v0, v1}, Lcom/amazon/ags/client/whispersync/migration/MigrationManager;->access$000(Lcom/amazon/ags/client/whispersync/migration/MigrationManager;Lcom/amazon/ags/api/whispersync/migration/MigrationCallback;)V

    .line 46
    return-void
.end method
