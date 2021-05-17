.class Lcom/prime31/EtceteraPlugin$23$1;
.super Ljava/lang/Object;
.source "EtceteraPlugin.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/EtceteraPlugin$23;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/prime31/EtceteraPlugin$23;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$prefs:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Lcom/prime31/EtceteraPlugin$23;Landroid/content/SharedPreferences;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$23$1;->this$1:Lcom/prime31/EtceteraPlugin$23;

    iput-object p2, p0, Lcom/prime31/EtceteraPlugin$23$1;->val$prefs:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lcom/prime31/EtceteraPlugin$23$1;->val$dialog:Landroid/app/Dialog;

    .line 1097
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1101
    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$23$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1102
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v3, "RTADontShowAgain"

    const/4 v4, 0x1

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1103
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1105
    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$23$1;->this$1:Lcom/prime31/EtceteraPlugin$23;

    invoke-static {v3}, Lcom/prime31/EtceteraPlugin$23;->access$0(Lcom/prime31/EtceteraPlugin$23;)Lcom/prime31/EtceteraPlugin;

    move-result-object v3

    const-string v4, "EtceteraAndroidManager"

    const-string v5, "askForReviewWillOpenMarket"

    const-string v6, ""

    invoke-virtual {v3, v4, v5, v6}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1108
    const-string v2, "market://details?id="

    .line 1110
    .local v2, "prefix":Ljava/lang/String;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_0

    .line 1112
    sget-object v3, Lcom/prime31/EtceteraPlugin;->TAG:Ljava/lang/String;

    const-string v4, "we have Honeycomb so redirect to the webpage instead of the Market"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1117
    :cond_0
    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$23$1;->this$1:Lcom/prime31/EtceteraPlugin$23;

    invoke-static {v3}, Lcom/prime31/EtceteraPlugin$23;->access$0(Lcom/prime31/EtceteraPlugin$23;)Lcom/prime31/EtceteraPlugin;

    move-result-object v3

    invoke-virtual {v3}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 1119
    .local v0, "appPackageName":Ljava/lang/String;
    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$23$1;->this$1:Lcom/prime31/EtceteraPlugin$23;

    invoke-static {v3}, Lcom/prime31/EtceteraPlugin$23;->access$0(Lcom/prime31/EtceteraPlugin$23;)Lcom/prime31/EtceteraPlugin;

    move-result-object v3

    iget-boolean v3, v3, Lcom/prime31/EtceteraPlugin;->isAmazonAppStore:Z

    if-eqz v3, :cond_1

    .line 1121
    const-string v2, "amzn://apps/android?p="

    .line 1122
    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$23$1;->this$1:Lcom/prime31/EtceteraPlugin$23;

    invoke-static {v3}, Lcom/prime31/EtceteraPlugin$23;->access$0(Lcom/prime31/EtceteraPlugin$23;)Lcom/prime31/EtceteraPlugin;

    move-result-object v3

    invoke-virtual {v3}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 1130
    :goto_0
    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$23$1;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v3}, Landroid/app/Dialog;->dismiss()V

    .line 1131
    return-void

    .line 1127
    :cond_1
    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$23$1;->this$1:Lcom/prime31/EtceteraPlugin$23;

    invoke-static {v3}, Lcom/prime31/EtceteraPlugin$23;->access$0(Lcom/prime31/EtceteraPlugin$23;)Lcom/prime31/EtceteraPlugin;

    move-result-object v3

    invoke-virtual {v3}, Lcom/prime31/EtceteraPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
