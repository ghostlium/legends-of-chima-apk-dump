.class Lcom/prime31/FlurryPlugin$3;
.super Ljava/lang/Object;
.source "FlurryPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/FlurryPlugin;->logTimedEvent(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/FlurryPlugin;

.field private final synthetic val$event:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/prime31/FlurryPlugin;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/FlurryPlugin$3;->this$0:Lcom/prime31/FlurryPlugin;

    iput-object p2, p0, Lcom/prime31/FlurryPlugin$3;->val$event:Ljava/lang/String;

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$3;->val$event:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;Z)V

    .line 97
    return-void
.end method
