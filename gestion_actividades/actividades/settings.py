"""
Django settings for actividades project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

RUTA_TEMPLATES = os.path.join(BASE_DIR, 'templates')

RUTA_STATIC = os.path.join(BASE_DIR, 'static')

STATICFILES_DIRS = (RUTA_STATIC,)

TEMPLATE_DIRS = (RUTA_TEMPLATES,)

MEDIA_ROOT = os.path.join(BASE_DIR, 'imagenes')
MEDIA_URL = '/imagenes/'

MEDIA_PDF = os.path.join(BASE_DIR, 'reporte')
REPORTE = '/reporte/'
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'la-4^=!yksv_3h7=)ic37f)58s8vv0l6*v7@+g^ce6c#%yz)va'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'apps.login',
    'apps.menu',
    'apps.registro.actividad',
    'apps.registro.administrador',
    'apps.configuraciones',
    'apps.asignaciones.asignar',
    'apps.reportes.reportes_actividades',
    'apps.usuario_depart'
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'actividades.urls'

WSGI_APPLICATION = 'actividades.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'actividades',
        'USER': 'actividad',
        'PASSWORD': 'aCt1vid@ad',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'es-ar'

TIME_ZONE = 'America/Caracas'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

STATIC_URL = '/static/'
