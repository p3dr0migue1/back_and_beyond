from django import forms

from .models import Posts, Tag


class PostsForm(forms.ModelForm):

    class Meta:
        model = Posts
        fields = ('title', 'markdown_text', 'status', 'tags')

    def __init__(self, *args, **kwargs):
        super(PostsForm, self).__init__(*args, **kwargs)
        self.fields['tags'] = forms.ModelMultipleChoiceField(
            widget=forms.CheckboxSelectMultiple(attrs={'id': 'tagslist'}),
            queryset=Tag.objects.all()
        )
