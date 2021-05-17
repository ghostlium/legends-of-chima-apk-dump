.class Lcom/amuzo/tech/legoid/LoginActivity$1$1;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amuzo/tech/legoid/LoginActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/amuzo/tech/legoid/LoginActivity$1;

.field private final synthetic val$a:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/amuzo/tech/legoid/LoginActivity$1;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$1;->this$1:Lcom/amuzo/tech/legoid/LoginActivity$1;

    iput-object p2, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$1;->val$a:Landroid/app/Activity;

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 86
    iget-object v0, p0, Lcom/amuzo/tech/legoid/LoginActivity$1$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 87
    return-void
.end method
