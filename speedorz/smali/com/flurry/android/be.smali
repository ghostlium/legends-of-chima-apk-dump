.class final Lcom/flurry/android/be;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private synthetic dc:Lcom/flurry/android/fs;

.field private synthetic dd:I

.field private synthetic de:Lcom/flurry/android/eu;


# direct methods
.method constructor <init>(Lcom/flurry/android/eu;Lcom/flurry/android/fs;I)V
    .locals 0

    .prologue
    .line 835
    iput-object p1, p0, Lcom/flurry/android/be;->de:Lcom/flurry/android/eu;

    iput-object p2, p0, Lcom/flurry/android/be;->dc:Lcom/flurry/android/fs;

    iput p3, p0, Lcom/flurry/android/be;->dd:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .prologue
    .line 838
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 839
    const-string v0, "sourceEvent"

    iget-object v1, p0, Lcom/flurry/android/be;->dc:Lcom/flurry/android/fs;

    iget-object v1, v1, Lcom/flurry/android/fs;->hQ:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 840
    iget-object v0, p0, Lcom/flurry/android/be;->de:Lcom/flurry/android/eu;

    const-string v1, "userConfirmed"

    iget-object v3, p0, Lcom/flurry/android/be;->de:Lcom/flurry/android/eu;

    iget-object v3, v3, Lcom/flurry/android/eu;->N:Lcom/flurry/android/AdUnit;

    iget-object v4, p0, Lcom/flurry/android/be;->de:Lcom/flurry/android/eu;

    iget-object v4, v4, Lcom/flurry/android/eu;->M:Lcom/flurry/android/ck;

    iget-object v5, p0, Lcom/flurry/android/be;->de:Lcom/flurry/android/eu;

    iget v5, v5, Lcom/flurry/android/eu;->O:I

    iget v6, p0, Lcom/flurry/android/be;->dd:I

    add-int/lit8 v6, v6, 0x1

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/android/eu;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/AdUnit;Lcom/flurry/android/ck;II)V

    .line 841
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 842
    iget-object v0, p0, Lcom/flurry/android/be;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->s(Lcom/flurry/android/eu;)Lcom/flurry/android/fl;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/be;->de:Lcom/flurry/android/eu;

    invoke-virtual {v0}, Lcom/flurry/android/eu;->aP()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 844
    iget-object v0, p0, Lcom/flurry/android/be;->de:Lcom/flurry/android/eu;

    invoke-static {v0}, Lcom/flurry/android/eu;->s(Lcom/flurry/android/eu;)Lcom/flurry/android/fl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/fl;->start()V

    .line 846
    :cond_0
    return-void
.end method
