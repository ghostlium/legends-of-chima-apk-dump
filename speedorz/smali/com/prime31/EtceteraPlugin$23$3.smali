.class Lcom/prime31/EtceteraPlugin$23$3;
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
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$23$3;->this$1:Lcom/prime31/EtceteraPlugin$23;

    iput-object p2, p0, Lcom/prime31/EtceteraPlugin$23$3;->val$prefs:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lcom/prime31/EtceteraPlugin$23$3;->val$dialog:Landroid/app/Dialog;

    .line 1149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1153
    iget-object v1, p0, Lcom/prime31/EtceteraPlugin$23$3;->this$1:Lcom/prime31/EtceteraPlugin$23;

    invoke-static {v1}, Lcom/prime31/EtceteraPlugin$23;->access$0(Lcom/prime31/EtceteraPlugin$23;)Lcom/prime31/EtceteraPlugin;

    move-result-object v1

    const-string v2, "EtceteraAndroidManager"

    const-string v3, "askForReviewDontAskAgain"

    const-string v4, ""

    invoke-virtual {v1, v2, v3, v4}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1154
    iget-object v1, p0, Lcom/prime31/EtceteraPlugin$23$3;->val$prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1155
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "RTADontShowAgain"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1156
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1158
    iget-object v1, p0, Lcom/prime31/EtceteraPlugin$23$3;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 1159
    return-void
.end method
