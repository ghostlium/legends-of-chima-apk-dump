.class public final Lcom/google/android/gms/internal/df;
.super Landroid/widget/ImageView;


# instance fields
.field private mq:Landroid/net/Uri;

.field private mr:I

.field private ms:I


# virtual methods
.method public bs()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/df;->mr:I

    return v0
.end method

.method public d(Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/df;->mq:Landroid/net/Uri;

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lcom/google/android/gms/internal/df;->ms:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/df;->ms:I

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    :cond_0
    return-void
.end method

.method public x(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/df;->mr:I

    return-void
.end method
