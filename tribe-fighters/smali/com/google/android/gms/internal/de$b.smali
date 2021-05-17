.class final Lcom/google/android/gms/internal/de$b;
.super Landroid/graphics/drawable/Drawable$ConstantState;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/de;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "b"
.end annotation


# instance fields
.field mo:I

.field mp:I


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/de$b;)V
    .locals 1

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    if-eqz p1, :cond_0

    iget v0, p1, Lcom/google/android/gms/internal/de$b;->mo:I

    iput v0, p0, Lcom/google/android/gms/internal/de$b;->mo:I

    iget v0, p1, Lcom/google/android/gms/internal/de$b;->mp:I

    iput v0, p0, Lcom/google/android/gms/internal/de$b;->mp:I

    :cond_0
    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/de$b;->mo:I

    return v0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/de;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/de;-><init>(Lcom/google/android/gms/internal/de$b;)V

    return-object v0
.end method
