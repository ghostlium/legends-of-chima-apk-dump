.class Lcom/prime31/EtceteraPlugin$18;
.super Ljava/lang/Object;
.source "EtceteraPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/EtceteraPlugin;->speak(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/EtceteraPlugin;

.field private final synthetic val$queueMode:I

.field private final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/prime31/EtceteraPlugin;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/EtceteraPlugin$18;->this$0:Lcom/prime31/EtceteraPlugin;

    iput-object p2, p0, Lcom/prime31/EtceteraPlugin$18;->val$text:Ljava/lang/String;

    iput p3, p0, Lcom/prime31/EtceteraPlugin$18;->val$queueMode:I

    .line 919
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 923
    iget-object v2, p0, Lcom/prime31/EtceteraPlugin$18;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-static {v2}, Lcom/prime31/EtceteraPlugin;->access$6(Lcom/prime31/EtceteraPlugin;)Ljava/util/HashMap;

    move-result-object v0

    .line 924
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/prime31/EtceteraPlugin$18;->this$0:Lcom/prime31/EtceteraPlugin;

    invoke-static {v2}, Lcom/prime31/EtceteraPlugin;->access$3(Lcom/prime31/EtceteraPlugin;)Landroid/speech/tts/TextToSpeech;

    move-result-object v2

    iget-object v3, p0, Lcom/prime31/EtceteraPlugin$18;->val$text:Ljava/lang/String;

    iget v4, p0, Lcom/prime31/EtceteraPlugin$18;->val$queueMode:I

    invoke-virtual {v2, v3, v4, v0}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I

    move-result v1

    .line 925
    .local v1, "status":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 926
    iget-object v2, p0, Lcom/prime31/EtceteraPlugin$18;->this$0:Lcom/prime31/EtceteraPlugin;

    const-string v3, "EtceteraAndroidManager"

    const-string v4, "ttsFailedToSpeak"

    const-string v5, ""

    invoke-virtual {v2, v3, v4, v5}, Lcom/prime31/EtceteraPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 927
    :cond_0
    return-void
.end method
