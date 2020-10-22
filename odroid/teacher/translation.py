from modeltranslation.translator import translator, TranslationOptions
from .models import Teacher

class TeacherTranslationOptions(TranslationOptions):
    fields = ("description",)

translator.register(Teacher, TeacherTranslationOptions)
