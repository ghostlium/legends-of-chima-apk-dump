.class Lcom/playhaven/android/view/HTMLView$SubcontentRequest;
.super Lcom/playhaven/android/req/SubcontentRequest;
.source "HTMLView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/view/HTMLView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SubcontentRequest"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/playhaven/android/view/HTMLView;


# direct methods
.method public constructor <init>(Lcom/playhaven/android/view/HTMLView;Ljava/lang/String;)V
    .locals 0
    .param p2, "dispatchContext"    # Ljava/lang/String;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/playhaven/android/view/HTMLView$SubcontentRequest;->this$0:Lcom/playhaven/android/view/HTMLView;

    .line 122
    invoke-direct {p0, p2}, Lcom/playhaven/android/req/SubcontentRequest;-><init>(Ljava/lang/String;)V

    .line 123
    return-void
.end method


# virtual methods
.method protected handleResponse(Ljava/lang/String;)V
    .locals 3
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView$SubcontentRequest;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-static {v0}, Lcom/playhaven/android/view/HTMLView;->access$2(Lcom/playhaven/android/view/HTMLView;)Lcom/playhaven/android/Placement;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/playhaven/android/Placement;->setModel(Ljava/lang/String;)V

    .line 128
    iget-object v1, p0, Lcom/playhaven/android/view/HTMLView$SubcontentRequest;->this$0:Lcom/playhaven/android/view/HTMLView;

    iget-object v0, p0, Lcom/playhaven/android/view/HTMLView$SubcontentRequest;->this$0:Lcom/playhaven/android/view/HTMLView;

    invoke-static {v0}, Lcom/playhaven/android/view/HTMLView;->access$2(Lcom/playhaven/android/view/HTMLView;)Lcom/playhaven/android/Placement;

    move-result-object v0

    invoke-virtual {v0}, Lcom/playhaven/android/Placement;->getModel()Ljava/lang/String;

    move-result-object v0

    const-string v2, "$.response.url"

    invoke-static {v0, v2}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/playhaven/android/view/HTMLView;->load(Ljava/lang/String;)V

    .line 129
    return-void
.end method
